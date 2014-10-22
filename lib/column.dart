part of entity;

/**
 * Defines a table column in a database.
 */
class Column {

  /// The name of the column.
  final String name;

  /// Whether the column uniquely defines the entity.
  final bool isPrimaryKey;

  /// Whether the column is a many-to-one foreign key.
  final bool isManyToOneForeignKey;

  /// Whether the column is a one-to-many foreign key.
  final bool isOneToManyForeignKey;

  /// Whether the column is a many-to-many foreign key.
  final bool isManyToManyForeignKey;

  /// Target property name of a foreign key column.
  final String targetName;

  /// Target junction table name of a foreign key column.
  final String junctionTableName;

  /// Target column name of the current entity for a many-to-many foreign key.
  final String targetColumnName;

  /// Target column name of the other entity for a many-to-many foreign key.
  final String otherColumnName;

  /// How the foreign key should behave when the entity is created or updated.
  final int onUpdate;

  /// How the foreign key should behave when the entity is deleted.
  final int onDelete;

  /// Represents a simple column that is not a primary key.
  const Column(this.name);

  /// Represents a primary key column that will uniquely define an entity. Only one such column can be in an entity.
  const Column.PrimaryKey(this.name)
    : isPrimaryKey = true;

  /// Represents a many-to-one foreign key. This targets another table for one entity.
  const Column.ManyToOneForeignKey(this.targetName, {this.onUpdate: ReferentialAction.RESTRICT, this.onDelete: ReferentialAction.RESTRICT})
    : isManyToOneForeignKey = true;

  /// Represents a one-to-many foreign key. This targets another table for a list of entity.
  const Column.OneToManyForeignKey(this.targetName, {this.onUpdate: ReferentialAction.RESTRICT, this.onDelete: ReferentialAction.RESTRICT})
    : isOneToManyForeignKey = true;

  /// Represents a many-to-many foreign key. This targets a junction table for a list of entity.
  const Column.ManyToManyForeignKey(this.junctionTableName, this.targetColumnName, this.otherColumnName, {this.onUpdate: ReferentialAction.RESTRICT, this.onDelete: ReferentialAction.RESTRICT})
    : isManyToManyForeignKey = true;

}
