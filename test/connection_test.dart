import 'package:connection/connection.dart';
import 'package:test/test.dart';

void main() {
  late Connection connection;

  tearDown(() {
    connection.close();
  });

  test('should receive HTTPS GET response', () async {
    connection = Connection(authority: 'swapi.dev');
    await connection
        .get(
          endpoint: '/api/people/1',
        )
        .then((response) => expect(
              response.statusCode,
              200,
            ));
  });

  test('should receive HTTPS POST response', () async {
    connection = Connection(authority: 'reqres.in');

    await connection.post(
      endpoint: '/api/users',
      payload: {
        'name': 'eve',
        'id': 'cityslicka',
      },
    ).then((response) => expect(
          response.statusCode,
          201,
        ));
  });
}
