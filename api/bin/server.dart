import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;

import 'package:server/key_api.dart';

void main(List<String> arguments) async {
  final app = Router();

  app.mount('/key/', KeyApi().router);

  await io.serve(app.handler, 'localhost', 8083);
}
