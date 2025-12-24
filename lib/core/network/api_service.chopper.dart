// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$FleetApi extends FleetApi {
  _$FleetApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = FleetApi;

  @override
  Future<dynamic> getVehicle(String vehicleId) async {
    final Uri $url = Uri.parse('/api/v1/vehicles/${vehicleId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    final Response $response = await client.send<dynamic, dynamic>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<dynamic> getLiveSensors(String vehicleId) async {
    final Uri $url = Uri.parse('/api/v1/vehicles/${vehicleId}/sensors/live');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    final Response $response = await client.send<dynamic, dynamic>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<dynamic> authenticateDriver({
    required List<int> faceImage,
    required String vehicleId,
  }) async {
    final Uri $url = Uri.parse('/api/v1/drivers/auth/face');
    final $body = <String, dynamic>{'vehicle_id': vehicleId};
    final List<PartValue> $parts = <PartValue>[
      PartValue<List<int>>(
        'image',
        faceImage,
      )
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parts: $parts,
      multipart: true,
    );
    final Response $response = await client.send<dynamic, dynamic>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<dynamic> enrollDriver({
    required String driverId,
    required List<List<int>> facePhotos,
    required String licenseNumber,
  }) async {
    final Uri $url = Uri.parse('/api/v1/drivers/${driverId}/enroll');
    final $body = <String, dynamic>{'license_number': licenseNumber};
    final List<PartValue> $parts = <PartValue>[
      PartValue<List<List<int>>>(
        'photos',
        facePhotos,
      )
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parts: $parts,
      multipart: true,
    );
    final Response $response = await client.send<dynamic, dynamic>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<dynamic> getIncidents({
    String? vehicleId,
    String? driverId,
    String? severity,
  }) async {
    final Uri $url = Uri.parse('/api/v1/incidents');
    final Map<String, dynamic> $params = <String, dynamic>{
      'vehicle_id': vehicleId,
      'driver_id': driverId,
      'severity': severity,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    final Response $response = await client.send<dynamic, dynamic>($request);
    return $response.bodyOrThrow;
  }
}
