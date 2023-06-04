class TruckModel {
  int? id = 0;
  String? model = "";
  String? brand = "";
  String? plate = "";
  int? year = 0;
  String? fuel = "";
  double? averageKm = 0;
  double? carbonKm = 0;
  
  TruckModel({
    this.id,
    this.model,
    this.brand,
    this.plate,
    this.year,
    this.fuel,
    this.averageKm,
    this.carbonKm,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'model': model,
      'brand': brand,
      'plate': plate,
      'year': year,
      'fuel': fuel,
      'averageKm': averageKm,
      'carbonKm': carbonKm,
    };
  }

  Map<dynamic, String> fromMap() {
    return {
      id: 'id',
      model: 'model',
      brand: 'brand',
      plate: 'plate',
      year: 'year',
      fuel: 'fuel',
      averageKm: 'averageKm',
      carbonKm: 'carbonKm',
    };
  }
}