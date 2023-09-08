import 'user.dart';

class Car {
  String _carId = '';
  String _carModel;
  String _carReleaseYear;
  String _carColor;
  String _carCompany;
  String _rentalCost;
  bool _isBooked = false;
  User? _bookedBy;
  String? _startDate;
  int? _duration;

  Car(this._carId, this._carModel, this._carReleaseYear, this._carColor,
      this._carCompany, this._rentalCost);
  String get carCompany => _carCompany;
  set carCompany(String value) {
    _carCompany = value;
  }

  String get rentalCost => _rentalCost;
  set rentalCost(String value) {
    _rentalCost = value;
  }

  String get carColor => _carColor;
  set carColor(String value) {
    _carColor = value;
  }

  String get carReleaseYear => _carReleaseYear;
  set carReleaseYear(String value) {
    _carReleaseYear = value;
  }

  String get carModel => _carModel;
  set carModel(String value) {
    _carModel = value;
  }

  String get carId => _carId;
  set carId(String value) {
    _carId = value;
  }

  bool get isBooked => _isBooked;
  User? get bookedBy => _bookedBy;
  String? get startDate => _startDate;
  int? get duration => _duration;

  void bookCar(User user, String startDate, int duration) {
    if (!_isBooked) {
      _isBooked = true;
      _bookedBy = user;
      _startDate = startDate;
      _duration = duration;
    } else {
      print('This car is already booked.');
    }
  }

  @override
  String toString() {
    return 'Car{_carId: $_carId, _carModel: $_carModel, _carReleaseYear: $_carReleaseYear, _carColor: $_carColor, _carCompany: $_carCompany, _rentalCost: $_rentalCost}';
  }
}
