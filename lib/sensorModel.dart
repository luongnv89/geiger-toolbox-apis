class SensorModel {
  final String key;
  final String value;

  SensorModel({
    required this.key,
    required this.value,
  });

  // Convert a Sensor into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'value': value,
    };
  }

  // Implement toString to make it easier to see information about
  // each Sensor when using the print statement.
  @override
  String toString() {
    return 'Sensor{key: $key, value: $value}';
  }
}
