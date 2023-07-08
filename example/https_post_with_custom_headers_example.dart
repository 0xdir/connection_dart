import 'package:connection/connection.dart';

void main() async {
  Connection connection = Connection(
    authority: 'reqres.in',
  );

  Response response = await connection.post(
    endpoint: '/api/users',
    payload: {
      'name': 'eve',
      'id': 'cityslicka',
    },
    headers: {'Content-Type': 'application/json'},
  );

  print(response.statusCode);
  print(response.body);

  connection.close();
}
