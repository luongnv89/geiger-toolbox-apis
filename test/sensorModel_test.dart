import 'package:test/test.dart';

import 'package:geiger_toolbox_apis/sensorModel.dart';

void main() async {
  group('Test SensorModel', () {
    test('should create a SensorModel', () {
      SensorModel sensor = SensorModel(key: 'sensor-key', value: '100');
      expect(sensor.key, 'sensor-key');
      expect(sensor.value, '100');
    });
  });
}
