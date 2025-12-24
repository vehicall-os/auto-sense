import 'package:chopper/chopper.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../storage/secure_storage.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/api/v1')
abstract class FleetApi extends ChopperService {
  static FleetApi create([ChopperClient? client]) => _$FleetApi(client);

  // Vehicle endpoints
  @Get(path: '/vehicles/{id}')
  Future<Response<Map<String, dynamic>>> getVehicle(@Path('id') String vehicleId);

  @Get(path: '/vehicles/{id}/sensors/live')
  Future<Response<Map<String, dynamic>>> getLiveSensors(@Path('id') String vehicleId);

  // Driver endpoints
  @Post(path: '/drivers/auth/face')
  @Multipart()
  Future<Response<Map<String, dynamic>>> authenticateDriver({
    @Part('image') required List<int> faceImage,
    @Field('vehicle_id') required String vehicleId,
  });

  @Post(path: '/drivers/{id}/enroll')
  @Multipart()
  Future<Response<void>> enrollDriver({
    @Path('id') required String driverId,
    @Part('photos') required List<List<int>> facePhotos,
    @Field('license_number') required String licenseNumber,
  });

  // Incident endpoints
  @Get(path: '/incidents')
  Future<Response<List<dynamic>>> getIncidents({
    @Query('vehicle_id') String? vehicleId,
    @Query('driver_id') String? driverId,
    @Query('severity') String? severity,
  });
}

class APIService {
  final Dio _dio;
  late final FleetApi _api;
  final String? baseUrl;

  APIService({this.baseUrl}) : _dio = Dio() {
    // Configure Dio
    _dio.options = BaseOptions(
      baseUrl: baseUrl ?? 'http://vehicle.local:8080/api/v1',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
    );

    // Add interceptors
    _dio.interceptors.addAll([
      // Auth interceptor
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorage().getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),

      // Logging interceptor
      LogInterceptor(
        requestHeader: true,
        responseHeader: true,
        error: true,
        requestBody: true,
        responseBody: true,
      ),
    ]);

    // Initialize Chopper
    _api = FleetApi.create(ChopperClient(client: _dio));
  }

  // Wrapper methods
  Future<Map<String, dynamic>?> getLiveVehicleData(String vehicleId) async {
    try {
      final response = await _api.getLiveSensors(vehicleId);
      if (response.isSuccessful) {
        return response.body;
      }
    } catch (e) {
      debugPrint('API error: $e');
      rethrow;
    }
    return null;
  }
}
