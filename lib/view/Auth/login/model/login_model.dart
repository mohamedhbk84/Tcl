// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

LoginModel loginModelFromMap(String str) =>
    LoginModel.fromMap(json.decode(str));

String loginModelToMap(LoginModel data) => json.encode(data.toMap());

class LoginModel {
  LoginModel({
    this.status,
    this.userdata,
  });

  String? status;
  Userdata? userdata;

  factory LoginModel.fromMap(Map<String,dynamic> json) => LoginModel(
        status: json["status"],
        userdata: Userdata.fromMap(json["Userdata"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "Userdata": userdata!.toMap(),
      };
}

class Userdata {
  Userdata({
    this.id,
    this.userImage,
    this.companyId,
    this.otherCompanyId,
    this.password,
    this.levelType,
    this.name,
    this.salutation,
    this.quickBookCode,
    this.email,
    this.contactNo,
    this.postionId,
    this.jobType,
    this.departmentId,
    this.altCountry,
    this.countryId,
    this.stateId,
    this.cityId,
    this.salaryContractId,
    this.reportReciveable,
    this.token,
    this.gender,
    this.religionId,
    this.nationalityId,
    this.personalEmail,
    this.personalPhone,
    this.birthday,
    this.education,
    this.address,
    this.homeAddress,
    this.facebook,
    this.homeNumber,
    this.joiningDate,
    this.contractFile,
    this.contractDate,
    this.basicSalary,
    this.reportingTo,
    this.salaryAccess,
    this.hrAccess,
    this.lastPasswordDate,
    this.recordStatus,
    this.deleteStatus,
    this.dateAdded,
    this.dateModified,
    this.addedBy,
    this.modifiedBy,
    this.lastLogin,
    this.lastPassword,
    this.updatedAt,
    this.createdAt,
    this.deviceId,
    this.apiToken,
    this.company,
    this.jobTitle,
    this.position,
  });

  int? id;
  dynamic userImage;
  dynamic companyId;
  dynamic otherCompanyId;
  String? password;
  int? levelType;
  String? name;
  dynamic salutation;
  dynamic quickBookCode;
  String? email;
  dynamic contactNo;
  dynamic postionId;
  dynamic jobType;
  dynamic departmentId;
  dynamic altCountry;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  dynamic salaryContractId;
  dynamic reportReciveable;
  dynamic token;
  dynamic gender;
  dynamic religionId;
  dynamic nationalityId;
  dynamic personalEmail;
  String? personalPhone;
  dynamic birthday;
  dynamic education;
  dynamic address;
  dynamic homeAddress;
  dynamic facebook;
  dynamic homeNumber;
  dynamic joiningDate;
  dynamic contractFile;
  dynamic contractDate;
  dynamic basicSalary;
  dynamic reportingTo;
  dynamic salaryAccess;
  int? hrAccess;
  dynamic lastPasswordDate;
  int? recordStatus;
  int? deleteStatus;
  dynamic dateAdded;
  dynamic dateModified;
  dynamic addedBy;
  dynamic modifiedBy;
  dynamic lastLogin;
  dynamic lastPassword;
  DateTime? updatedAt;
  DateTime? createdAt;
  dynamic deviceId;
  String? apiToken;
  String? company;
  dynamic jobTitle;
  String? position;

  factory Userdata.fromMap(Map<String, dynamic> json) => Userdata(
        id: json["id"],
        userImage: json["user_image"],
        companyId: json["company_id"],
        otherCompanyId: json["other_company_id"],
        password: json["password"],
        levelType: json["level_type"],
        name: json["name"],
        salutation: json["salutation"],
        quickBookCode: json["quick_book_code"],
        email: json["email"],
        contactNo: json["contact_no"],
        postionId: json["postion_id"],
        jobType: json["job_type"],
        departmentId: json["department_id"],
        altCountry: json["alt_country"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        salaryContractId: json["salary_contract_id"],
        reportReciveable: json["report_reciveable"],
        token: json["token"],
        gender: json["gender"],
        religionId: json["religion_id"],
        nationalityId: json["nationality_id"],
        personalEmail: json["personal_email"],
        personalPhone: json["personal_phone"],
        birthday: json["birthday"],
        education: json["education"],
        address: json["address"],
        homeAddress: json["home_address"],
        facebook: json["facebook"],
        homeNumber: json["home_number"],
        joiningDate: json["joining_date"],
        contractFile: json["contract_file"],
        contractDate: json["contract_date"],
        basicSalary: json["basic_salary"],
        reportingTo: json["reporting_to"],
        salaryAccess: json["salary_access"],
        hrAccess: json["hr_access"],
        lastPasswordDate: json["last_password_date"],
        recordStatus: json["record_status"],
        deleteStatus: json["delete_status"],
        dateAdded: json["date_added"],
        dateModified: json["date_modified"],
        addedBy: json["added_by"],
        modifiedBy: json["modified_by"],
        lastLogin: json["last_login"],
        lastPassword: json["last_password"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        deviceId: json["device_id"],
        apiToken: json["api_token"],
        company: json["company"],
        jobTitle: json["job_title"],
        position: json["position"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_image": userImage,
        "company_id": companyId,
        "other_company_id": otherCompanyId,
        "password": password,
        "level_type": levelType,
        "name": name,
        "salutation": salutation,
        "quick_book_code": quickBookCode,
        "email": email,
        "contact_no": contactNo,
        "postion_id": postionId,
        "job_type": jobType,
        "department_id": departmentId,
        "alt_country": altCountry,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "salary_contract_id": salaryContractId,
        "report_reciveable": reportReciveable,
        "token": token,
        "gender": gender,
        "religion_id": religionId,
        "nationality_id": nationalityId,
        "personal_email": personalEmail,
        "personal_phone": personalPhone,
        "birthday": birthday,
        "education": education,
        "address": address,
        "home_address": homeAddress,
        "facebook": facebook,
        "home_number": homeNumber,
        "joining_date": joiningDate,
        "contract_file": contractFile,
        "contract_date": contractDate,
        "basic_salary": basicSalary,
        "reporting_to": reportingTo,
        "salary_access": salaryAccess,
        "hr_access": hrAccess,
        "last_password_date": lastPasswordDate,
        "record_status": recordStatus,
        "delete_status": deleteStatus,
        "date_added": dateAdded,
        "date_modified": dateModified,
        "added_by": addedBy,
        "modified_by": modifiedBy,
        "last_login": lastLogin,
        "last_password": lastPassword,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "device_id": deviceId,
        "api_token": apiToken,
        "company": company,
        "job_title": jobTitle,
        "position": position,
      };
}
