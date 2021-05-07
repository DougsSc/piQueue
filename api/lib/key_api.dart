import 'dart:convert';

import 'package:server/data/key_type.dart';
import 'package:server/managers/key_manager.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';

class KeyApi {
  final KeyManager service = KeyManager();

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      return Response.ok(
        (await json.encode(await service.data)),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/common', (Request request) async {
      return Response.ok(
        (await service.common)?.toJson() ?? '{}',
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/preferential', (Request request) async {
      return Response.ok(
        (await service.preferential)?.toJson() ?? '{}',
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.post('/common', (Request request) async {
      return Response.ok(
        (await service.nextKey(KeyType.COMMON))?.toJson() ?? '{}',
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.post('/preferential', (Request request) async {
      return Response.ok(
        (await service.nextKey(KeyType.PREFERENTIAL))?.toJson() ?? '{}',
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}
