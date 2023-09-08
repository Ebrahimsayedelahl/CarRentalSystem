import 'dart:io';

import 'car.dart';
import 'user.dart';

void main() {
  Car car1 = Car('1', 'Hyundi verna', '2010', 'white', 'Hyundi', '\$10');
  Car car2 = Car('2', 'Toyota corolla', '2013', 'silver', 'Toyota', '\$20');
  Car car3 = Car('3', 'Kia Rio', '2018', 'Blue', 'Kia', '\$20');
  Car car4 = Car('4', 'Chevrolet optera', '2019', 'blue', 'Chevrolet', '\$15');
  Car car5 = Car('5', 'Honda civic', '2015', 'white', 'Honda', '\$25');
  Car car6 = Car('6', 'Fiat tipo', '2021', 'brown', 'Fiat', '\$40');
  Car car7 = Car('7', 'Kia sportage', '2018', 'red', 'kia', '\$40');
  Car car8 = Car('8', 'Opel insignia', '2017', 'black', 'Opel', '\$50');
  Car car9 = Car('9', 'Mercedes c180', '2020', 'black', 'Mercedes', '\$55');
  Car car10 = Car('10', 'BMW X6', '2021', 'white', 'BMW', '\$60');

  // Class User
  User user1 = User('1', 'Ahmed Mohammed', 'ahmed@example.com', 'password123',
      'Cairo', false, []);
  User user2 = User('2', 'Ibrahim mohammed', 'ibrahim@example.com',
      'password456', 'Giza', false, []);
  User user3 = User('3', 'Tarek Khaled', 'tarek@example.com', 'password789',
      'Alexandria', false, []);
  User user4 = User('2', 'Kareem Hassan', 'kareem@example.com', 'passwordabc',
      'AlMahala', true, []);

  List<Car> allCars = [
    car1,
    car2,
    car3,
    car4,
    car5,
    car6,
    car7,
    car8,
    car9,
    car10
  ];
  List<User> allUsers = [user1, user2, user3, user4];
  print('Welcome!');
  print('E-mail:');
  String? email = stdin.readLineSync();
  print('Password:');
  String? password = stdin.readLineSync();

  User? currentUser;
  bool isUserFound = false;
  bool isBlockedUser = false;

  for (User user in allUsers) {
    if (user.email == email && user.password == password) {
      currentUser = user;
      isUserFound = true;
      if (user.blocked) {
        isBlockedUser = true;
      }
      break;
    }
  }

  if (isBlockedUser) {
    print('User is blocked!');
  } else if (isUserFound) {
    print('Login successful!');

    print('To see our cars, press 1');
    String? input = stdin.readLineSync();

    if (input == '1') {
      for (Car car in allCars) {
        print(car.toString());
        print('---');
      }
      print('To reserve a car, press 1:');
      print('To display your reserved car, press 2:');
      String? input = stdin.readLineSync();
      if (input == '1') {
        print('Enter the Car ID to book:');
        String? carId = stdin.readLineSync();

        Car? selectedCar;
        for (Car car in allCars) {
          if (car.carId == carId) {
            selectedCar = car;
            currentUser!.bookCar(selectedCar);
            break;
          }
        }

        if (selectedCar != null) {
          print('Enter the rental start date:');
          String? startDate = stdin.readLineSync();
          print('Enter the rental duration (in days):');
          String? duration = stdin.readLineSync();

          selectedCar.bookCar(currentUser!, startDate!, int.parse(duration!));
          print('Car booked successfully!');
        } else {
          print('Invalid Car ID');
        }

        print('To see your booked cars, press 2');
        String? viewBookedCars = stdin.readLineSync();

        if (viewBookedCars == '2') {
          displayBookedCars(currentUser!);
        } else {
          print('Invalid option');
        }
      } else if (input == '2') {
        displayBookedCars(currentUser!);
      }
    } else {
      print('Invalid option');
    }
  } else {
    print('Invalid email or password!');
  }
}

void displayBookedCars(User user) {
  List<Car> bookedCars = user.getBookedCars();

  if (bookedCars.isNotEmpty) {
    print('Your booked cars:$bookedCars');
  } else {
    print('You have not booked any cars.');
  }
}
