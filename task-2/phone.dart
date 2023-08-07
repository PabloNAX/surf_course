class Phone {
  final String brand;
  final String model;
  final DateTime releaseDate;
  final String color;
  final Camera? camera;
  double? price;

  Phone({
    required this.brand,
    required this.model,
    required this.releaseDate,
    required this.color,
    this.camera,
    this.price,
  });

  Phone.samsung(this.model, this.releaseDate, this.color, this.camera)
      : brand = 'Samsung';

  void calling() => print('Calling');
  void takePhoto() => print('Take Photo');
}

class Camera {
  final String model;
  final String resolution;
  Camera({
    required this.model,
    required this.resolution,
  });
}

void main() {
  final samsungA31 = Phone.samsung(
      'model', DateTime.now(), 'color', Camera(model: 'ds', resolution: 'sd'));
  print(samsungA31.brand);
}
