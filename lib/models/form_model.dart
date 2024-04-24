class FormModel {
  final String name;
  final String phone;
  final String maintenanceType;
  final int buildingNo;
  final int floorNo;
  final int apartmentNo;

  FormModel({
    required this.name,
    required this.phone,
    required this.maintenanceType,
    required this.buildingNo,
    required this.floorNo,
    required this.apartmentNo,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      name: json['name'],
      phone: json['phone'],
      maintenanceType: json['maintenanceType'],
      buildingNo: json['buildingNo'],
      floorNo: json['floorNo'],
      apartmentNo: json['apartmentNo'],
    );
  }
}
