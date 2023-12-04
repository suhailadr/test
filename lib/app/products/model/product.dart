import 'package:hive/hive.dart';
part 'product.g.dart';

@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)
  int? errorCode;
  @HiveField(1)
  List<Product>? data;
  @HiveField(2)
  String? message;

  ProductModel({this.errorCode, this.data, this.message});

  ProductModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
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

@HiveType(typeId: 2)
class Product {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? image;

  @HiveField(3)
  int? price;

  @HiveField(4)
  String? createdDate;

  @HiveField(5)
  String? createdTime;

  @HiveField(6)
  String? modifiedDate;

  @HiveField(7)
  String? modifiedTime;

  @HiveField(8)
  bool? flag;

  Product({
    this.id,
    this.name,
    this.image,
    this.price,
    this.createdDate,
    this.createdTime,
    this.modifiedDate,
    this.modifiedTime,
    this.flag,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
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
    data['image'] = this.image;
    data['price'] = this.price;
    data['created_date'] = this.createdDate;
    data['created_time'] = this.createdTime;
    data['modified_date'] = this.modifiedDate;
    data['modified_time'] = this.modifiedTime;
    data['flag'] = this.flag;
    return data;
  }
}
