import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:server/bancoDeDados.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:test/test.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/get-medico/<crm>/', _user);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

dynamic myEncode(dynamic item) {
  if (item is DateTime) {
    return item.toIso8601String();
  }
  return item;
}

FutureOr<Response> _user(Request request, String crm) async {
  final m = '+';
  final s = ' ';
  crm.replaceAll(m,s);
  print(crm);
  List<Map<String, Map<String, dynamic>>> result = await BD.bd!
      .mappedResultsQuery("select * from medico where crm = '$crm';");

  return Response.ok(
    json.encode(result, toEncodable: myEncode),
    headers: {
     "Access-Control-Allow-Origin": "*", 
     "Access-Control-Allow-Credentials": "true", 
     "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
     "Access-Control-Allow-Methods": "POST, OPTIONS"
   }
  );
}

FutureOr<List<Map<String, Map<String, dynamic>>>> teste() async {
  List<Map<String, Map<String, dynamic>>> result =
      await BD.bd!.mappedResultsQuery("select * from usuario");
  return result;
}

void main(List<String> args) async {
  var bd = await BD.createConnection();
  var result = await BD.bd!.query("select * from usuario");

  print(result);
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final _handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(_handler, ip, port);
  print('Server listening on port ${server.port}');

  //BD.bd!.close();
}
