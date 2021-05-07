import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:server/data/key.dart';
import 'package:server/data/key_situation.dart';
import 'package:server/data/key_type.dart';
import 'package:server/managers/storage_manager.dart';
import 'package:server/utils/helper.dart';

class KeyManager {
  final _storage = StorageManager();

  Future<List> get data async => json.decode(await _storage.read());

  Future<List<Key>> get keys async =>
      (await data).map<Key>((map) => Key.fromMap(map)).toList();

  Future<Key> get common async => (await keys).firstWhere((key) =>
      key.situation == KeySituation.PENDING && key.type == KeyType.COMMON);

  Future<Key> get preferential async =>
      (await keys).firstWhere((key) =>
          key.situation == KeySituation.PENDING &&
          key.type == KeyType.PREFERENTIAL) ??
      await common;

  Future<Key> nextKey(KeyType type) async {
    final keyList = await keys;

    final last = keyList.lastWhere((key) => key.type == type)?.key ?? '';
    final next = convertToInt(last.substring(1, 4) ?? 0) + 1;

    final key = Key(
      id: (keyList.last?.id ?? 0) + 1,
      key: '${type.name()}${next.toString().padLeft(3, '0')}',
      type: type,
      situation: KeySituation.PENDING,
    );

    final list = await data;
    list.add(key.toFileMap());

    await _storage.write(json.encode(list));

    return key;
  }
}
