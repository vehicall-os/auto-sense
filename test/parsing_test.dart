import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

// Simple model for testing purposes if actual models are not easily accessible/mockable in this context
class MockVehicleData {
  final String id;
  final String make;
  final String model;
  final double healthScore;

  MockVehicleData({required this.id, required this.make, required this.model, required this.healthScore});

  factory MockVehicleData.fromJson(Map<String, dynamic> json) {
    return MockVehicleData(
      id: json['id'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      healthScore: (json['health_score'] as num).toDouble(),
    );
  }
}

void main() {
  group('Vehicle Data Parsing', () {
    test('should parse valid vehicle json correctly', () {
      // Arrange
      final jsonString = '{"id": "v123", "make": "Tesla", "model": "Model 3", "health_score": 98.5}';
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // Act
      final vehicle = MockVehicleData.fromJson(jsonMap);

      // Assert
      expect(vehicle.id, 'v123');
      expect(vehicle.make, 'Tesla');
      expect(vehicle.model, 'Model 3');
      expect(vehicle.healthScore, 98.5);
    });

    test('should handle integer health score as double', () {
       // Arrange
      final jsonString = '{"id": "v124", "make": "Ford", "model": "F-150", "health_score": 90}';
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // Act
      final vehicle = MockVehicleData.fromJson(jsonMap);

      // Assert
      expect(vehicle.healthScore, 90.0);
    });
  });
}
