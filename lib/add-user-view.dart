import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sdtest/user-controller.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({Key? key}) : super(key: key);

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {

  int _index = 0;
  final sectionInfo = GlobalKey<FormState>();
  final sectionAddress = GlobalKey<FormState>();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController province = TextEditingController();
  final TextEditingController address = TextEditingController();


  var provinceTH = [
    'กรุงเทพฯ',
    'กระบี่',
    'กาญจนบุรี',
    'กาฬสินธุ์',
    'กำแพงเพชร',
    'ขอนแก่น',
    'จันทบุรี',
    'ฉะเชิงเทรา',
    'ชลบุรี',
    'ชัยนาท',
    'ชัยภูมิ',
    'ชุมพร',
    'เชียงใหม่',
    'เชียงราย',
    'ตรัง',
    'ตราด',
    'ตาก',
    'นครนายก',
    'นครปฐม',
    'นครพนม',
    'นครราชสีมา',
    'นครศรีธรรมราช',
    'นครสวรรค์',
    'นนทบุรี',
    'นราธิวาส',
    'น่าน',
    'บึงกาฬ',
    'บุรีรัมย์',
    'ปทุมธานี',
    'ประจวบคีรีขันธ์',
    'ปราจีนบุรี',
    'ปัตตานี',
    'พระนครศรีอยุธยา',
    'พะเยา',
    'พังงา',
    'พัทลุง',
    'พิจิตร',
    'พิษณุโลก',
    'เพชรบุรี',
    'เพชรบูรณ์',
    'แพร่',
    'ภูเก็ต',
    'มหาสารคาม',
    'มุกดาหาร',
    'แม่ฮ่องสอน',
    'ยโสธร',
    'ยะลา',
    'ร้อยเอ็ด',
    'ระนอง',
    'ระยอง',
    'ราชบุรี',
    'ลพบุรี',
    'ลำปาง',
    'ลำพูน',
    'เลย',
    'ศรีสะเกษ',
    'สกลนคร',
    'สงขลา',
    'สตูล',
    'สมุทรปราการ',
    'สมุทรสงคราม',
    'สมุทรสาคร',
    'สระแก้ว',
    'สระบุรี',
    'สิงห์บุรี',
    'สุโขทัย',
    'สุพรรณบุรี',
    'สุราษฎร์ธานี',
    'สุรินทร์',
    'หนองคาย',
    'หนองบัวลำภู',
    'อ่างทอง',
    'อำนาจเจริญ',
    'อุดรธานี',
    'อุตรดิตถ์',
    'อุทัยธานี',
    'อุบลราชธานี',
  ];
  var selectProvince = 0;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 30.h,
          padding: EdgeInsets.only(top: 1.h),

          color: Colors.white,
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.transparent,
          child: SafeArea(child:
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon: Icon(Icons.arrow_back_ios_new_rounded,size: 20.sp,color: Colors.black,)),
                      Text('เพิ่มข้อมูลใหม่',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),),

                    ],
                  ),
                ),
                Stepper(
                  physics: NeverScrollableScrollPhysics(),
                  currentStep: _index,
                  onStepCancel: () {
                    if (_index > 0) {
                      setState(() {
                        _index -= 1;
                      });
                    }
                  },
                  onStepContinue: () {
                    if (_index == 0 ) {
                      sectionInfo.currentState!.validate();
                      if(firstName.text.isNotEmpty && lastName.text.isNotEmpty){
                        setState(() {
                          _index += 1;
                        });
                      }

                    } else {
                      sectionAddress.currentState!.validate();
                      if(address.text.isNotEmpty && province.text.isNotEmpty){
                        Get.find<UserController>().save(firstName.text, lastName.text, province.text, address.text);
                      }
                    }

                  },

                  steps: <Step>[
                    Step(
                      title: Text('ข้อมูลส่วนตัว'),
                      content: Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Form(
                          key: sectionInfo,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ชื่อจริง'),
                              SizedBox(height: 1.h,),
                              TextFormField(
                                validator:(text){
                                  if (text!.isEmpty){
                                    return 'กรุณาใส้ข้อมูล';
                                  }
                                  return null;
                                },
                                controller: firstName,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.blue, width: 1.3),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.red, width: 1.3),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              borderSide: BorderSide(color: Colors.red, width: 1.3),
                              ),
                                ),
                              ),

                              SizedBox(height: 2.h,),

                              Text('นามสกุล'),
                              SizedBox(height: 1.h,),
                              TextFormField(
                                validator:(text){
                                  if (text!.isEmpty){
                                    return 'กรุณาใส้ข้อมูล';
                                  }
                                  return null;
                                },
                                controller: lastName,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.blue, width: 1.3),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.red, width: 1.3),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.red, width: 1.3),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),
                      )
                    ),
                    Step(
                      title: Text('ข้อมูลที่อยู่ตามบัตรประชาชน'),
                      content: Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Form(
                          key: sectionAddress,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('จังหวัด'),
                              SizedBox(height: 1.h,),
                              GestureDetector(
                                onTap: (){
                                  _showDialog(
                                    CupertinoPicker(
                                      magnification: 1.22,
                                      squeeze: 1.2,
                                      useMagnifier: true,
                                      itemExtent: 35,
                                      onSelectedItemChanged: (int selectedItem) {
                                        setState(() {
                                          selectProvince = selectedItem;
                                          province.text = provinceTH[selectedItem];

                                        });
                                      },
                                      children:
                                      List<Widget>.generate(provinceTH.length, (int index) {
                                        return Center(
                                          child: Text(
                                            provinceTH[index],
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                                  child: TextFormField(

                                    enabled: false,
                                    controller: province,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(color: Colors.blue, width: 1.3),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(color: Colors.red, width: 1.3),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(color: Colors.red, width: 1.3),
                                      ),
                                    ),
                                  ),
                              ),

                              SizedBox(height: 2.h,),

                              Text('ที่อยู่'),
                              SizedBox(height: 1.h,),
                              TextFormField(
                                maxLines: 5,
                                validator:(text){
                                  if (text!.isEmpty){
                                    return 'กรุณาใส้ข้อมูล';
                                  }
                                  return null;
                                },
                                controller: address,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.blue, width: 1.3),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.red, width: 1.3),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.red, width: 1.3),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      )
                    ),
                  ],
                ),
              ],
            ),
          )
          ),
        ),
      ),
    );
  }
}
