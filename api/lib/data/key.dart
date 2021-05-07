import 'dart:convert';

import 'package:server/data/key_situation.dart';
import 'package:server/data/key_type.dart';

class Key {
  int id;
  String key;
  KeyType type;
  KeySituation situation;

  Key({
    this.id,
    this.key,
    this.type,
    this.situation,
  });

  factory Key.fromJson(String str) => Key.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Key.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    key = map['key'];
    type = KeyType.values[map['type']];
    situation = KeySituation.values[map['situation']];
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['type'] = type.name();
    data['situation'] = situation.name();
    return data;
  }

  Map<String, dynamic> toFileMap() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['type'] = KeyType.values.indexOf(type);
    data['situation'] = KeySituation.values.indexOf(situation);
    return data;
  }
}
