enum KeySituation { PENDING, ACCEPTED, CONCLUDED }

extension KeySituationExtension on KeySituation {
  String name() {
    switch (this) {
      case KeySituation.PENDING:
        return "Pendente";
        break;
      case KeySituation.ACCEPTED:
        return "Aceito";
        break;
      case KeySituation.CONCLUDED:
        return "Concluído";
        break;
    }

    return "n/d";
  }
}
