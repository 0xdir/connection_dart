import 'dart:convert';
import 'package:connection/connection.dart';

void main() async {
  /// Initialize the main object
  ///
  /// Provide the domain authority
  ///
  /// eg. swapi.dev
  /// eg. api.example.com
  ///
  /// Provide optional default headers
  Connection connection = Connection(authority: 'swapi.dev');

  try {
    /// Call the endpoint
    ///
    /// Provide optional call-specific headers if necessary
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
