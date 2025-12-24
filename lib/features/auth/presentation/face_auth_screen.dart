import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Enum for auth status
enum AuthStatus { initial, capturing, success, failed, error }

class FaceAuthScreen extends ConsumerStatefulWidget {
  const FaceAuthScreen({super.key, required this.vehicleId});

  final String vehicleId;

  @override
  ConsumerState<FaceAuthScreen> createState() => _FaceAuthScreenState();
}

class _FaceAuthScreenState extends ConsumerState<FaceAuthScreen> {
  CameraController? _cameraController;
  bool _isCapturing = false;
  AuthStatus _authStatus = AuthStatus.initial;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) return;

    final frontCamera = cameras.firstWhere(
      (c) => c.lensDirection == CameraDirection.front,
      orElse: () => cameras.first,
    );

    _cameraController = CameraController(
      frontCamera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    await _cameraController!.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _performAuthentication() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) return;

    setState(() {
      _isCapturing = true;
      _authStatus = AuthStatus.capturing;
    });

    try {
      // Mock Auth for now
      await Future.delayed(const Duration(seconds: 2));
      
      setState(() {
        _isCapturing = false;
        _authStatus = AuthStatus.success;
      });

      if (mounted) {
        context.go('/driver/dashboard');
      }
    } catch (e) {
      setState(() {
        _isCapturing = false;
        _authStatus = AuthStatus.error;
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(_cameraController!),
          Positioned(
            bottom: 32,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _getBorderColor(),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  _getStatusMessage(),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: _isCapturing ? null : _performAuthentication,
                  icon: const Icon(Icons.face_unlock),
                  label: Text(_isCapturing ? 'Authenticating...' : 'Start Shift'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getBorderColor() {
    switch (_authStatus) {
      case AuthStatus.capturing: return Colors.orange;
      case AuthStatus.success: return Colors.green;
      case AuthStatus.failed: return Colors.red;
      default: return Colors.white54;
    }
  }

  String _getStatusMessage() {
    switch (_authStatus) {
      case AuthStatus.initial: return 'Position face in circle';
      case AuthStatus.capturing: return 'Hold still...';
      case AuthStatus.success: return 'Welcome back!';
      case AuthStatus.failed: return 'Try again';
      default: return 'Unknown error';
    }
  }
}
