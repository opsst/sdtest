import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sdtest/add-user-view.dart';
import 'package:sdtest/user-controller.dart';
import 'package:sdtest/user-info-view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin{

  late TabController tabController;
  final TextEditingController province = TextEditingController();


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
  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
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
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Get.to(
            () => const AddUserView()
        );
      }, label: Text('เพิ่มรายชื่อ'),icon: Icon(Icons.add),),
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              TabBar(
                onTap: (index){
                  print(Get.find<UserController>().savedProfile[0].toString());
                },
                controller: tabController, tabs: [
                  Tab(text: 'รายชื่อทั้งหมด'),
                  Tab(text: 'รายชื่อตามจังหวัด'),

              ],
                labelStyle: TextStyle(fontSize: 16.sp),
                unselectedLabelStyle: TextStyle(fontSize: 16.sp),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
              ),
              Expanded(child:
              TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(

                    itemCount: Get.find<UserController>().savedProfile.length,
                      itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        Get.to(
                          arguments: index,
                            () => UserInfoView()
                        );
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.all(3.w),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Get.find<UserController>().savedProfile[index].firstName.value+" "+Get.find<UserController>().savedProfile[index].lastName.value,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                                  Text(Get.find<UserController>().savedProfile[index].province.value,style: TextStyle(color: Colors.blue,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                                ],
                              ),
                              Spacer(),
                              IconButton(onPressed: (){
                                showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    content: Text('ต้องการลบ '+Get.find<UserController>().savedProfile[index].firstName.value+" "+Get.find<UserController>().savedProfile[index].lastName.value),
                                    actions: [
                                      TextButton(onPressed: (){
                                        Get.find<UserController>().savedProfile.removeAt(index);
                                        Get.back();
                                      }, child: Text('ลบ',style: TextStyle(color: Colors.red),)),
                                      TextButton(onPressed: (){
                                        Get.back();
                                      }, child: Text('ยกเลิก')),

                                    ],
                                  );
                                });
                              }, icon: Icon(Icons.delete_forever_rounded,color: Colors.red,))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.h,),
                        Text('เลือกจังหวัด'),
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
                                    Get.find<UserController>().filter(provinceTH[selectedItem]);

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

                        Expanded(
                          child: ListView.builder(itemCount: Get.find<UserController>().filterProfile.length,itemBuilder: (context,index){
                            return GestureDetector(
                              onTap: (){
                                Get.to(
                                    arguments: index,
                                        () => UserInfoView()
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w,vertical: 1.5.w),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(Get.find<UserController>().filterProfile[index].firstName.value+" "+Get.find<UserController>().filterProfile[index].lastName.value,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                                          Text(Get.find<UserController>().filterProfile[index].province.value,style: TextStyle(color: Colors.blue,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                                        ],
                                      ),
                                      Spacer(),
                                      IconButton(onPressed: (){
                                        showDialog(context: context, builder: (BuildContext context){
                                          return AlertDialog(
                                            content: Text('ต้องการลบ '+Get.find<UserController>().filterProfile[index].firstName.value+" "+Get.find<UserController>().filterProfile[index].lastName.value),
                                            actions: [
                                              TextButton(onPressed: (){
                                                Get.find<UserController>().savedProfile.removeWhere((element) => element.firstName.value == Get.find<UserController>().filterProfile[index].firstName.value);
                                                Get.find<UserController>().filterProfile.removeAt(index);
                                                Get.back();
                                              }, child: Text('ลบ',style: TextStyle(color: Colors.red),)),
                                              TextButton(onPressed: (){
                                                Get.back();
                                              }, child: Text('ยกเลิก')),

                                            ],
                                          );
                                        });
                                      }, icon: Icon(Icons.delete_forever_rounded,color: Colors.red,))
                                    ],
                                  ),
                                ),
                              ),
                            );

                          }),
                        )
                      ],
                    ),
                  ),

                ],
              )),
            ],
          ),
        ),
      )
    );
  }
}
