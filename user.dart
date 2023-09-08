import 'car.dart';

class User {
  late String _userId;
  String _name;
  String _email;
  String _password;
  String _address;
  bool _blocked;
  List<Car> _bookedCars = [];
  User(this._userId, this._name, this._email, this._password, this._address,
      this._blocked, this._bookedCars);
  bool get blocked => _blocked;
  set blocked(bool value) {
    _blocked = value;
  }

  String get address => _address;
  set address(String value) {
    _address = value;
  }

  String get password => _password;
  set password(String value) {
    _password = value;
  }

  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String get userId => _userId;
  set userId(String value) {
    _userId = value;
  }

  List<Car> get bookedCars => _bookedCars;
  void bookCar(Car car) {
    _bookedCars.add(car);
  }

  List<Car> getBookedCars() {
    return _bookedCars;
  }

  @override
  String toString() {
    return 'User{_userId: $_userId, _name: $_name, _email: $_email, _password: $_password, _address: $_address, _blocked: $_blocked}';
  }
}
