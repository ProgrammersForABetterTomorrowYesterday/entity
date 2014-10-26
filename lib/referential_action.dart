part of entity;

/**
 * Defines how a foreign key behaves when the entity is updated or deleted.
 */
class ReferentialAction {

  /// Foreign key will not update nor be deleted.
  static const int RESTRICT = 0x00;

  /// Foreign key will update or be deleted.
  static const int CASCADE = 0x01;

  /// Not implemented yet.
  static const int SETNULL = 0x02;

}
