class FormModel {
  final String name;
  final String phone;
  final String maintenanceType;
  String? formId;
  final String buildingNo;
  final String floorNo;
  final String apartmentNo;
  String? addressDetails;
  String? maintenanceDetails;
  String? permission;

  FormModel({
    required this.formId,
    required this.name,
    required this.phone,
    required this.maintenanceType,
    required this.buildingNo,
    required this.floorNo,
    required this.apartmentNo,
    required this.addressDetails,
    required this.maintenanceDetails,
    required this.permission,
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
      addressDetails: json['addressDetails'],
      maintenanceDetails: json['maintenanceDetails'],
      permission: json['permission'],
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
      'addressDetails': addressDetails,
      'maintenanceDetails': maintenanceDetails,
      'permission': permission,
    };
  }
}
