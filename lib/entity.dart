library magnetfruit_entity;

import 'dart:mirrors';

part 'column.dart';
part 'referential_action.dart';
part 'table.dart';

class Entity {

  Map toJson() {
    var map = new Map(),
    im = reflect(this),
    cm = im.type;

    cm.declarations.values
      .where((dm) => dm is VariableMirror)
      .forEach((dm) {
        var key = MirrorSystem.getName(dm.simpleName),
        val = im.getField(dm.simpleName).reflectee;

        map[key] = val;
      });

    return map;
  }

}
