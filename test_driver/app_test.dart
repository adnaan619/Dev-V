// Imports the Flutter Driver API.

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter driver test App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final writeDataFinder = find.byValueKey("write_data");
    final addDataFinder = find.byValueKey("add_data");
    var dummy_data = "hello";

    FlutterDriver? driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver?.close();
      }
    });
    test("check health", () async {
      Health? health = await driver?.checkHealth();
      print(health?.status);
    });


    test("flutter drive test", () async {
      await driver?.tap(writeDataFinder);
      await driver?.enterText(dummy_data);
      await driver?.screenshot();
      await driver?.tap(addDataFinder);
      await driver?.screenshot();
    });
  });
}

