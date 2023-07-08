[![pub package](https://img.shields.io/pub/v/connection.svg)](https://pub.dev/packages/connection)
[![package publisher](https://img.shields.io/pub/publisher/connection.svg)](https://pub.dev/packages/connection/publisher)

An opinionated wrapper around the revered http package, where HTTP responses are objects 
for easy parsing and error handling.

## Using

The easiest way to use this library is via the top-level ```Connection``` class.

```dart
import 'package:connection/connection.dart';

void main() async {

  /// Initialize the main object
  Connection connection = Connection(
    authority: 'swapi.dev',
    defaultHeaders: {'Content-Type': 'application/json'},
  );
  
  try {
    /// Call the endpoint
    Response response = await connection.get(
      endpoint: '/api/people/1',
    );
    if (response.statusCode == 200) {
      /// Do stuff with the response
      print(response.statusCode);
      print(json.decode(response.body));
    } else {
      /// Handle the server error
      print('Server Error: ${response.statusCode}:');
      print(response.body);
    }
  } catch (e) {
    /// Throws an exception if an unknown error occurs
    print(e);
  }

  /// Close the connection
  connection.close();
}
```

## Supported calls

Implemented:
1. https 
2. default and custom headers
3. GET with query params
4. POST with payload

Not implemented:
1. everything else

If more features are needed, feel free to open a discussion on github.

## Getting Help

Submit an issue on [github].

[github]: https://github.com/0xdir/connection_dart

## How to contribute

All feedback and suggestions for improvements are welcome:

1. Open a discussion on [github]
2. Discuss proposed changes
3. Submit a PR (optional)

[github]: https://github.com/0xdir/connection_dart

## Support my work

This package is possible thanks to the people and companies
who donate money, services or time to keep the project running.

If you're interested in becoming a Sponsor, Backer or Contributor
to expand the project, reach out to me on [github].

[github]: https://github.com/sponsors/0xdir

Or buy me coffee at `0xdir.near`.