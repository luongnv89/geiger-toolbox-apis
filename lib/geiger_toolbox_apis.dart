library geiger_toolbox_apis;

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:geiger_toolbox_apis/constants.dart';
import 'package:geiger_toolbox_apis/sensorModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// A Calculator.
class GeigerToolboxAPIs {
  var database;
  /**
   * Establish the connection
   */
  Future<void> connect() async {
    // Avoid errors caused by flutter upgrade.
    // Importing 'package:flutter/widgets.dart' is required.
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    this.database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), GeigerConfigs.DB_NAME),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE ${GeigerConfigs.DB_SENSING_DATA_TABLE}(key TEXT PRIMARY KEY, value TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  // Define a function that inserts a sensing data into the database
  Future<void> addSensingData(String key, String value) async {
    // Get a reference to the database.
    final db = await this.database;

    // Insert the sensing into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same sensing data is inserted twice.
    //
    // In this case, replace any previous data.
    SensorModel newSensingData = SensorModel(key: key, value: value);
    await db.insert(
      GeigerConfigs.DB_SENSING_DATA_TABLE,
      newSensingData.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String?> getSensingData(String key) async {
    // Get a reference to the database.
    final db = await this.database;
    final String sensingData = await db.query(
        'SELECT value FROM ${GeigerConfigs.DB_SENSING_DATA_TABLE} WHERE key=$key');
    return sensingData;
  }
}
