class LocalUser {
  String? index;
  String? userId;
  String? fullName;
  String? fatherName;
  String? email;
  String? cnicNo;
  String? contactNo;
  String? cityId;
  String? dateOfBirth;
  String? gender;
  String? qualification;
  String? address;
  String? registrationNo;

  LocalUser(
      {this.index,
      this.userId,
      this.fullName,
      this.fatherName,
      this.email,
      this.cnicNo,
      this.contactNo,
      this.cityId,
      this.dateOfBirth,
      this.gender,
      this.qualification,
      this.address,
      this.registrationNo});

  LocalUser.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    userId = json['user_id'];
    fullName = json['full_name'];
    fatherName = json['father_name'];
    email = json['email'];
    cnicNo = json['cnic_no'];
    contactNo = json['contact_no'];
    cityId = json['city_id'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    qualification = json['qualification'];
    address = json['address'];
    registrationNo = json['registration_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    data['father_name'] = this.fatherName;
    data['email'] = this.email;
    data['cnic_no'] = this.cnicNo;
    data['contact_no'] = this.contactNo;
    data['city_id'] = this.cityId;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['qualification'] = this.qualification;
    data['address'] = this.address;
    data['registration_no'] = this.registrationNo;
    return data;
  }
}
