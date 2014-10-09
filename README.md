#Entity

Entity definition. Used by various magnetfruit programs. They provide all the information needed by the
[avocadorm]() to talk to a database, so there is no need for extra configuration files.

*  [Homepage](http://www.magnetfruit.com/entity)
*  [GitHub Repository](https://github.com/magnetfruit/entity)
*  [Pub package](https://pub.dartlang.org/packages/magnetfruit_entity)

##Creating an entity
An entity is simply a [domain model](http://en.wikipedia.org/wiki/Domain_model) class that extends from ```Entity```,
and that is annotated with a few metadata.

```dart
part of entities;

@Table('employee')
class Employee extends Entity {

  @Column.PrimaryKey('employee_id')
  int employeeId;

  @Column('name')
  String name;

  @Column('company_id')
  int companyId;

  @Column.ManyToOneForeignKey('companyId')
  Company company;

  @Column.OneToManyForeignKey('employeeId')
  List<Project> projects;

} 
```

Visit the [homepage](http://www.magnetfruit.com/entity) for information about entities, properties, and entity
libraries.
 