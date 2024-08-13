class EmployeeModal {
  late String id, name, designation;

  EmployeeModal(
      this.id,
      this.name,
      this.designation,
      );

  factory EmployeeModal.formJson(Map m1) {
    return EmployeeModal(
      m1['id'],
      m1['name'],
      m1['designation'],
    );
  }
}