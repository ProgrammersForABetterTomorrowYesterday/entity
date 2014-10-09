/**
 * Domain model definition. Used by various magnetfruit programs.
 *
 * An entity allows the user to define his domain models at the same time as giving information about the relevant
 * database tables and rows.
 *
 * Please visit the [magnetfruit](http://www.magnetfruit.com/) website for documentation and examples about
 * [entities](http://www.magnetfruit.com/entity/).
 */
library entity;

import 'dart:mirrors';

part 'column.dart';
part 'referential_action.dart';
part 'table.dart';

/**
 * Abstract implementation of an entity.
 *
 * All entities must extend from this class.
 */
class Entity {

  /// Overrides the toJson method so that an entity can be converted to a JSON string.
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
