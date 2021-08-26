# testing_geiger_toolbox_apis

Geiger Toolbox APIs for Flutter application

## Getting Started
For installing the package, please refer to [installation](https://pub.dev/packages/geiger_toolbox_apis/install)

## APIs

### Connect to the database
Initalize the connection to the database: `GeigerToolboxAPIs.connect()`

### Add sensing data to the database

```
Future<void> addSensingData(String key, String value)
```

Example
```
await GeigerToolboxAPIs.addSensingData('score', "100");
```
### Get a sensing data by key

```
Future<String?> getSensingData(String key)
```

Example
```
String? value = await GeigerToolboxAPIs.getSensingData('score');
```