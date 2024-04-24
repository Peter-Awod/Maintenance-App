class FormModel {
  final String name;
  final String phone;
  final String maintenanceType;
  String? formId;
  final int buildingNo;
  final int floorNo;
  final int apartmentNo;

  FormModel({
    required this.formId,
    required this.name,
    required this.phone,
    required this.maintenanceType,
    required this.buildingNo,
    required this.floorNo,
    required this.apartmentNo,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      formId: json['formId'],
      name: json['name'],
      phone: json['phone'],
      maintenanceType: json['maintenanceType'],
      buildingNo: json['buildingNo'],
      floorNo: json['floorNo'],
      apartmentNo: json['apartmentNo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'formId': formId,
      'name': name,
      'phone': phone,
      'maintenanceType': maintenanceType,
      'buildingNo': buildingNo,
      'floorNo': floorNo,
      'apartmentNo': apartmentNo,
    };
  }
}
