
class BrandCar {
  int id;
  String brand;
  String logo;

  BrandCar({required this.id, required this.brand, required this.logo});

  factory BrandCar.fromJson(Map<String, dynamic> json) {
    return BrandCar(
      id: json['id']??0,
      brand: json['brand']??'',
      logo: json['logo']??'',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'brand': brand,
    'logo': logo,
  };
}




