import 'dart:io';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'config/supabase.dart';
import 'routes/main_route.dart';


void main(List<String> args) async {
  // withHotreload(
  //   () => createServer(),
  //   onReloaded: () => print('Reload!'),
  //   onHotReloadNotAvailable: () => print('No hot-reload :('),
  //   onHotReloadAvailable: () => print('Yay! Hot-reload :)'),
  //   onHotReloadLog: (log) => print('Reload Log: ${log.message}'),
  //   logLevel: Level.INFO,
  // );
  await createServer();
}

Future<HttpServer> createServer() async {
  SupaBaseIntegration().supabase;

  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = await serve(MainRoute().route, ip, port);
  print('Server listening on port ${server.port}');
  return server;
}
