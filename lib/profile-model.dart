import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ProfileModel{
  var firstName = ''.obs;
  var lastName = ''.obs;
  var province = ''.obs;
  var address = ''.obs;

  @override
  String toString() {
    return '{firstName: $firstName, lastName: $lastName,'
        'province: $province, address: $address,}';
  }

}
