import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../storage/secure_storage.dart';

class WebSocketService {
  WebSocketChannel? _channel;
  final _streamController = StreamController<dynamic>.broadcast();
  final Map<String, StreamSubscription> _subscriptions = {};

  Stream<dynamic> get stream => _streamController.stream;

  Future<void> connect(String vehicleId) async {
    final token = await SecureStorage().getToken();
    // Default to localhost for emulator if running on Android/iOS, or vehicle.local for production
    final wsUrl = 'ws://vehicle.local:8080/ws/vehicle/$vehicleId?token=$token';

    try {
      _channel = WebSocketChannel.connect(Uri.parse(wsUrl));

      _subscriptions['main'] = _channel!.stream.listen(
            (message) {
          final data = jsonDecode(message);
          _streamController.add(data);
        },
        onError: (error) {
          debugPrint('WebSocket error: $error');
          _attemptReconnect(vehicleId);
        },
        onDone: () {
          debugPrint('WebSocket closed');
          _attemptReconnect(vehicleId);
        },
      );
    } catch (e) {
      debugPrint('WebSocket connection failed: $e');
      _attemptReconnect(vehicleId);
    }
  }

  void _attemptReconnect(String vehicleId, [int attempt = 0]) {
    if (attempt >= 5) return;

    Future.delayed(Duration(seconds: math.pow(2, attempt).toInt()), () {
      debugPrint('WebSocket reconnecting... attempt $attempt');
      connect(vehicleId);
    });
  }

  void disconnect() {
    for (var sub in _subscriptions.values) {
      sub.cancel();
    }
    _subscriptions.clear();
    _channel?.sink.close();
    _channel = null;
  }

  void send(String message) {
    _channel?.sink.add(message);
  }
}
