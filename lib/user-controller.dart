import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sdtest/profile-model.dart';

class UserController extends GetxController{

  var savedProfile = [].obs;
  var filterProfile = [].obs;

  void save(firstName,lastName,province,address){
    var profileModel = ProfileModel();

    profileModel.firstName.value = firstName;
    profileModel.lastName.value = lastName;
    profileModel.province.value = province;
    profileModel.address.value = address;

    savedProfile.add(profileModel);
    print(savedProfile.length);
    print(profileModel.toString());
    Get.back();

  }
  void filter(province){
    filterProfile.value = [];
    savedProfile.forEach((element) {
      if(province==element.province.value){
        filterProfile.add(element);
      }
    });
  }

}