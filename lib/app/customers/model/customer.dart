import 'package:hive/hive.dart';
part 'customer.g.dart';

@HiveType(typeId: 3)
class CustomerModel {
  @HiveField(1)
  int? errorCode;
  @HiveField(2)
  List<Customer>? data;
  @HiveField(3)
  String? message;

  CustomerModel({this.errorCode, this.data, this.message});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    if (json['data'] != null) {
      data = <Customer>[];
      json['data'].forEach((v) {
        data!.add(new Customer.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

@HiveType(typeId: 4)
class Customer {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? profilePic;

  @HiveField(3)
  String? mobileNumber;

  @HiveField(4)
  String? email;

  @HiveField(5)
  String? street;

  @HiveField(6)
  String? streetTwo;

  @HiveField(7)
  String? city;

  @HiveField(8)
  int? pincode;

  @HiveField(9)
  String? country;

  @HiveField(10)
  String? state;

  @HiveField(11)
  String? createdDate;

  @HiveField(12)
  String? createdTime;

  @HiveField(13)
  String? modifiedDate;

  @HiveField(14)
  String? modifiedTime;

  @HiveField(15)
  bool? flag;

  Customer({
    this.id,
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
    this.flag,
  });

  Customer.fromJson(Map<String, dynamic> json) {
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
