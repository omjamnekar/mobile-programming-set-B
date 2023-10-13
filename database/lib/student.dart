class StudentModel {
  final int? id;
  final String sname;
  final int rno;
  final String address;
  StudentModel(
      {this.id, required this.address, required this.rno, required this.sname});

  StudentModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        sname = res['sname'],
        rno = res['rno'],
        address = res['address'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'sname': sname,
      'rno': rno,
      'address': address,
    };
  }
}
