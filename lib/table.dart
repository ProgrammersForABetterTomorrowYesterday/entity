part of magnetfruit_entity;

class Table {
  final String tableName;
  final int allowHttpMethods;

  const Table(this.tableName, {this.allowHttpMethods: HttpMethod.NONE});
}
