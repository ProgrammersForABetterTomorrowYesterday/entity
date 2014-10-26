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

import 'dart:async';
import 'dart:mirrors';
import 'package:magnetfruit_avocadorm/avocadorm.dart';

part 'column.dart';
part 'referential_action.dart';
part 'table.dart';

/**
 * Abstract implementation of an entity.
 *
 * All entities must extend from this class. The Avocadorm is a singleton, so `new Avocadorm()` will return the
 * current Avocadorm instance. This means that there can only be one Avocadorm running on a system.
 */
class Entity {

  // Holds a reference to the Avocadorm used by the system.
  Avocadorm _avocadorm;

  /// Entity constructor, retrieves the current Avocadorm singleton.
  Entity() {
    this._avocadorm = new Avocadorm();
  }

  /// Entity shortcut to create it in the database.
  Future<Object> create() {
    return this._avocadorm.create(this);
  }

  /// Entity shortcut to update it in the database.
  Future<Object> update() {
    return this._avocadorm.update(this);
  }

  /// Entity shortcut to save it in the database.
  Future<Object> save() {
    return this._avocadorm.save(this);
  }

  /// Entity shortcut to delete it from the database.
  Future<Object> delete() {
    return this._avocadorm.delete(this);
  }

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
