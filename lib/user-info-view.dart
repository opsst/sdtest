import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sdtest/user-controller.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({Key? key}) : super(key: key);

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Scaffold(
          body: SafeArea(child: Padding(
            padding: EdgeInsets.all(3.w),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.arrow_back_ios_new_rounded,size: 20.sp,color: Colors.black,)),
                    Text('ข้อมูลผู้ใช้งาน',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),),

                  ],
                ),
                SizedBox(height: 3.h,),

                Text(Get.find<UserController>().savedProfile[Get.arguments].firstName.value+" "+Get.find<UserController>().savedProfile[Get.arguments].lastName.value,style: TextStyle(color: Colors.blue,fontSize: 18.sp,fontWeight: FontWeight.w600),),
                Text(Get.find<UserController>().savedProfile[Get.arguments].province.value,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600)),
                Text(Get.find<UserController>().savedProfile[Get.arguments].address.value,style: TextStyle(fontSize: 18.sp)),

              ],
            ),
          )),
        )
    );
  }
}
