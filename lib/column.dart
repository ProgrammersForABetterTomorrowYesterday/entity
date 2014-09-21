part of magnetfruit_entity;

class Column {
  final String name;
  final bool isPrimaryKey;

  final bool isManyToOneForeignKey;
  final bool isOneToManyForeignKey;
  final String targetName;
  final int onUpdate;
  final int onDelete;

  const Column(this.name);

  const Column.PrimaryKey(this.name)
    : isPrimaryKey = true;

  const Column.ManyToOneForeignKey(this.targetName, {this.onUpdate: ReferentialAction.RESTRICT, this.onDelete: ReferentialAction.RESTRICT})
    : isManyToOneForeignKey = true;

  const Column.OneToManyForeignKey(this.targetName, {this.onUpdate: ReferentialAction.RESTRICT, this.onDelete: ReferentialAction.RESTRICT})
    : isOneToManyForeignKey = true;
}
