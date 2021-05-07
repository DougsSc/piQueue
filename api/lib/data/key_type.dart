enum KeyType { COMMON, PREFERENTIAL }

extension KeyTypeExtension on KeyType {
  String name() {
    switch (this) {
      case KeyType.COMMON:
        return "C";
        break;
      case KeyType.PREFERENTIAL:
        return "P";
        break;
    }

    return null;
  }
}
