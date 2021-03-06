import 'dart:ui';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'dart:convert';

import 'SignUp_Button.dart';


class SignUp extends StatefulWidget {

  /// --- Third Receiver --- ///
  String id;
  String doctorSpeciality;
  String experience;
  String degree;
  String doctorImage;
  String doctorId;
  String doctorName;
  String doctorNameLast;
  String doctorFees;

  SignUp({
    Key key,
    this.doctorFees,
    this.id,
    this.doctorImage,
    this.degree,
    this.experience,
    this.doctorId,
    this.doctorName,
    this.doctorNameLast,
    this.doctorSpeciality,
  });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  void initState()
  {
    super.initState();
  }

  String country = '';
  String setNumber;

  void setCountry(CountryCode value) {
    country = value.toCountryStringOnly();
    print(country);
    print("cccccc");
    setNumber = value.toString();
    print('set number $setNumber');
    print(country);
  }

  /// ========= Radio Value Function ========== ///

  int _radioValue;
  void _handleRadioValueChange(int value) {
    setState(() {

      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  /// ========= Image Picker Function 1 ========= ///

  var photoBase64;

  File _image;

  final picker = ImagePicker();

  List<String> images=[];

  File imageResized;
  File imageResized1;

  /// ========= Image Picker Function 0 ========= ///
  //// ======== Image  Converter 0 ========= ///

  Future getImage(ImageSource source) async {
    print('image 0');
    // var photo = await ImagePicker.pickImage(source: source);
    final photo = await picker.getImage(source: ImageSource.gallery);


    imageResized = await FlutterNativeImage.compressImage(photo.path,
        quality: 100, targetWidth: 100, targetHeight: 100);

    setState(() {
      // _photo = photo;

      List<int> imageBytes = imageResized.readAsBytesSync();
      photoBase64 = base64Encode(imageBytes);
      debugPrint('$photoBase64');
      images.add(photoBase64);

    });
  }

  /// ========= Image Picker Function 1 ========= ///
  //// ======== Image  Converter 1 ========= ///

  Future getImage1(ImageSource source) async {
    print('image 1');

    final photo = await picker.getImage(source: ImageSource.gallery);

    imageResized1 = await FlutterNativeImage.compressImage(photo.path,
        quality: 100, targetWidth: 100, targetHeight: 100);

    setState(() {
      // _photo = photo;

      List<int> imageBytes = imageResized1.readAsBytesSync();
      photoBase64 = base64Encode(imageBytes);
      debugPrint('$photoBase64');
      images.add(photoBase64);

    });
  }


  /// ========= Controllers ========= ///
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.navigate_before_rounded,
              size: 35,),
            onPressed: (){
              Navigator.of(context).pop();

            }),
        title: Image.asset('assests/logo.png',
          color: Color.fromRGBO(231, 232, 225, 1),
          scale: 4.3,
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(7, 78, 99, 0.8),

      ),

      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height*1,
          color: Colors.grey.shade100,
          padding: EdgeInsets.only(left: 15, right: 15, top: 5),

          child: Column(
            children: [

              Container(
                  child: Text(
                '\nSign Up\n',
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(7, 78, 99, 0.8),
                    letterSpacing: 0.7,
                ),)),

              /// --- First Name
              // Container(
              //   padding: EdgeInsets.only(bottom: 3),
              //   child: Row(
              //     children: [
              //       Text('    First Name*',
              //           textScaleFactor: 1.0,
              //           style: TextStyle(fontWeight: FontWeight.w600)),
              //     ],
              //   ),),

              Theme(
                data: ThemeData(primaryColor: Colors.transparent),
                child: Container(
                  height: 55,
                  child: Card(
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      margin: EdgeInsets.only(right: 10, left: 10),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.person,
                              color: Color.fromRGBO(7, 78, 99, 0.7),
                            ),
                          ),
                          Container(
                            // color: Colors.blue,
                            width: MediaQuery.of(context).size.width*0.65,
                            child: TextField(
                              maxLines: 1,
                              selectionWidthStyle: BoxWidthStyle.tight,
                              controller: nameController,
                              cursorColor: Color.fromRGBO(7, 78, 99, 0.7),
                              decoration: InputDecoration(
                                  hintText: 'First Name',
                                  enabledBorder: InputBorder.none,contentPadding: EdgeInsets.only(left: 7)),),
                          ),
                        ],
                      )),
                ),
              ),


              /// --- Last Name
              // Container(
              //   padding: EdgeInsets.only(bottom: 3),
              //   child: Row(
              //     children: [
              //       Text('\n    Last Name*',
              //           textScaleFactor: 1.0,
              //           style: TextStyle(fontWeight: FontWeight.w600)),
              //     ],
              //   ),),

              Container(height: 20),

              Theme(
                data: ThemeData(primaryColor: Colors.transparent),
                child: Container(
                  height: 55,
                  child: Card(
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      margin: EdgeInsets.only(right: 10, left: 10),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.person,
                              color: Color.fromRGBO(7, 78, 99, 0.7),
                            ),
                          ),
                          Container(
                            // color: Colors.blue,
                            width: MediaQuery.of(context).size.width*0.65,
                            child: TextField(
                              maxLines: 1,
                              selectionWidthStyle: BoxWidthStyle.tight,
                              controller: lastNameController,
                              cursorColor: Color.fromRGBO(7, 78, 99, 0.7),
                              decoration: InputDecoration(
                                  hintText: 'Last Name',
                                  enabledBorder: InputBorder.none,contentPadding: EdgeInsets.only(left: 7)),),
                          ),
                        ],
                      )),
                ),
              ),


              /// --- Email
              Container(height: 20),

              Theme(
                data: ThemeData(primaryColor: Colors.transparent),
                child: Container(
                  height: 55,
                  child: Card(
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      margin: EdgeInsets.only(right: 10, left: 10),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.mail,
                              color: Color.fromRGBO(7, 78, 99, 0.7),
                            ),
                          ),
                          Container(
                            // color: Colors.blue,
                            width: MediaQuery.of(context).size.width*0.65,
                            child: TextField(
                              maxLines: 1,
                              selectionWidthStyle: BoxWidthStyle.tight,
                              controller: emailController,
                              cursorColor: Color.fromRGBO(7, 78, 99, 0.7),
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  enabledBorder: InputBorder.none,contentPadding: EdgeInsets.only(left: 7)),),
                          ),
                        ],
                      )),
                ),
              ),


              /// --- Pass
              Container(height: 20),

              Theme(
                data: ThemeData(primaryColor: Colors.transparent),
                child: Container(
                  height: 55,
                  child: Card(
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      margin: EdgeInsets.only(right: 10, left: 10),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.lock,
                              color: Color.fromRGBO(7, 78, 99, 0.7),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.6,
                            child: TextField(
                              maxLines: 1,
                              selectionWidthStyle: BoxWidthStyle.tight,
                              controller: passController,
                              cursorColor: Color.fromRGBO(7, 78, 99, 0.7),
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  enabledBorder: InputBorder.none,contentPadding: EdgeInsets.only(left: 7)),),
                          ),
                        ],
                      )),
                ),
              ),

              /// --- Confirm Pass
              Container(height: 20),

              Theme(
                data: ThemeData(primaryColor: Colors.transparent),
                child: Container(
                  height: 55,
                  child: Card(
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      margin: EdgeInsets.only(right: 10, left: 10),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.lock,
                              color: Color.fromRGBO(7, 78, 99, 0.7),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.6,
                            child: TextField(
                              maxLines: 1,
                              selectionWidthStyle: BoxWidthStyle.tight,
                              controller: confirmPassController,
                              cursorColor: Color.fromRGBO(7, 78, 99, 0.7),
                              decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  enabledBorder: InputBorder.none,contentPadding: EdgeInsets.only(left: 7)),),
                          ),
                        ],
                      )),
                ),
              ),

              // --- Country
              Container(height: 20),

              Theme(
                data: ThemeData(primaryColor: Colors.transparent),
                child: Container(

                  height: 55,
                  width: MediaQuery.of(context).size.width*1,
                  child: Card(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      color: Colors.white,

                      child: CountryCodePicker(
                        favorite: ['+92'],
                        onInit: setCountry,
                        onChanged: setCountry,
                        initialSelection: '+92',
                        showCountryOnly: true,
                        flagWidth: 30,
                        alignLeft: false,
                        showOnlyCountryWhenClosed: true,
                      ),

                  ),
                ),
              ),

              /// --- Phone Number
              Container(height: 20),

              Theme(
                data: ThemeData(primaryColor: Colors.transparent),
                child: Container(
                  height: 55,
                  child: Card(
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      margin: EdgeInsets.only(right: 10, left: 10),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.smartphone,
                              color: Color.fromRGBO(7, 78, 99, 0.7),
                            ),
                          ),
                          Container(
                            // color: Colors.blue,
                            width: MediaQuery.of(context).size.width*0.65,
                            child: TextField(
                              maxLines: 1,
                              selectionWidthStyle: BoxWidthStyle.tight,
                              controller: phoneController,
                              cursorColor: Color.fromRGBO(7, 78, 99, 0.7),
                              decoration: InputDecoration(
                                  hintText: 'Phone',
                                  prefix: Container(
                                    child: Text(setNumber == null ? "" : setNumber),
                                  ),
                                  enabledBorder: InputBorder.none,contentPadding: EdgeInsets.only(left: 7)),),
                          ),
                        ],
                      )),
                ),
              ),

              Container(height: 25),

              SignUpButton(),

              Container(height: 40),

            ],
          ),
        ),
      ),
    );
  }
}