class CustomerResponse {
  int? errorCode;
  Data? data;
  String? message;

  CustomerResponse({this.errorCode, this.data, this.message});

  CustomerResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? profilePic;
  String? mobileNumber;
  String? email;
  String? street;
  String? streetTwo;
  String? city;
  int? pincode;
  String? country;
  String? state;
  String? createdDate;
  String? createdTime;
  String? modifiedDate;
  String? modifiedTime;
  bool? flag;

  Data(
      {this.id,
      this.name,
      this.profilePic,
      this.mobileNumber,
      this.email,
      this.street,
      this.streetTwo,
      this.city,
      this.pincode,
      this.country,
      this.state,
      this.createdDate,
      this.createdTime,
      this.modifiedDate,
      this.modifiedTime,
      this.flag});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePic = json['profile_pic'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    street = json['street'];
    streetTwo = json['street_two'];
    city = json['city'];
    pincode = json['pincode'];
    country = json['country'];
    state = json['state'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    modifiedDate = json['modified_date'];
    modifiedTime = json['modified_time'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile_pic'] = this.profilePic;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['street'] = this.street;
    data['street_two'] = this.streetTwo;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['country'] = this.country;
    data['state'] = this.state;
    data['created_date'] = this.createdDate;
    data['created_time'] = this.createdTime;
    data['modified_date'] = this.modifiedDate;
    data['modified_time'] = this.modifiedTime;
    data['flag'] = this.flag;
    return data;
  }
}
