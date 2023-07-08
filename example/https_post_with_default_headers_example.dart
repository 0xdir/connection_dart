import 'package:connection/connection.dart';

void main() async {
  Connection connection = Connection(
    authority: 'reqres.in',
    defaultHeaders: {'Content-Type': 'application/json'},
  );

  Response response = await connection.post(
    endpoint: '/api/users',
    payload: {
      'name': 'eve',
      'id': 'cityslicka',
    },
  );

  print(response.statusCode);
  print(response.body);

  connection.close();
}
