import 'package:connection/connection.dart';

void main() async {
  Connection connection = Connection(authority: 'swapi.dev');

  Response response = await connection.get(
    endpoint: '/api/people/1',
    params: {'format': 'wookiee'},
  );

  print(response.statusCode);
  print(response.body);

  connection.close();
}
