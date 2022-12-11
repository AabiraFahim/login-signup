import 'package:login_signup/view/auth/term_condition_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constant/constant.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameTextEditingController = TextEditingController();
  final TextEditingController _emailTextEditController = TextEditingController();
  final TextEditingController _passwordTextEditController1 = TextEditingController();
  final TextEditingController _passwordTextEditController2 = TextEditingController();
  final TextEditingController _phoneNoTextEditController = TextEditingController();
  final TextEditingController _teacherIdTextEditController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  static List<String> userType = <String>[
    'Student', 'Teacher'
  ];
  static List<String> gender = <String>[
    'Male', 'F-Male'
  ];
  String? _selectedUserType;
  String? _selectedGender;
  bool obscure = true;
  bool terms = false;

  void visibility(){
    setState(() {
      obscure = !obscure;
    });
  }
  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                 SizedBox(height: height*.005,),
                Image(
                  image: const AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                  width: width*.4,
                ),
                SizedBox(height: height*.005,),
                Align(
                  alignment: Alignment.center,
                  child: Text("Register Here",style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                  ),),
                ),
                SizedBox(height: height*.007,),
                SizedBox(height: height*0.025,),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            controller: _nameTextEditingController,
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'Please enter your canteen name';
                              }
                              else if(value.length < 3 ){
                                return 'Enter the correct name';
                              }
                              return null;
                            },
                            hintText: "Canteen Name"),
                        SizedBox(height: height*0.023,),
                        CustomTextField(
                            controller: _emailTextEditController,
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'Please enter your email';
                              }
                              else if(!EmailValidator.validate(value))
                              {
                                return 'email address is not valid';
                              }
                              return null;
                            },
                            hintText: "Admin Email"),
                        SizedBox(height: height*0.023,),
                        CustomTextField(
                            textInputType: TextInputType.number,
                            controller: _phoneNoTextEditController,
                            validator: (value) {
                              String pattern = r'(^(?:[+0]9)?[0-9]{11,12}$)';
                              RegExp regExp =  RegExp(pattern);
                              if (value
                                  .trim()
                                  .isEmpty) {
                                return 'Please enter your mobile number';
                              }
                              else if (!regExp.hasMatch(value)) {
                                return 'Please enter valid mobile number';
                              }
                              return null;
                            },
                            hintText: "Phone Number"),
                        SizedBox(height: height*0.023,),
                        CustomTextField(
                          controller: _passwordTextEditController1,
                          hideText: obscure,
                          trailingIcon: obscure ? IconButton(
                            icon: const Icon(Icons.remove_red_eye,
                              color: kButtonColor,),
                            onPressed: visibility,
                          ) : IconButton
                            (onPressed: visibility,
                              icon: const Icon(Icons.visibility_off,
                                color: kButtonColor,
                              )),
                          hintText: "Canteen ID",
                          validator:(value) {
                            if (value.isEmpty) {
                              return 'Please enter Canteen ID' ;
                            }
                            else if(value.length < 6 ){
                              return 'ID must be at least 6 characters';
                            }
                            return null;
                          },),
                        SizedBox(height: height*0.023,),
                        CustomTextField(
                          controller: _passwordTextEditController2,
                          hideText: obscure,
                          trailingIcon: obscure ? IconButton(
                            icon: const Icon(Icons.remove_red_eye,
                              color: kButtonColor,),
                            onPressed: visibility,
                          ) : IconButton
                            (onPressed: visibility,
                              icon: const Icon(Icons.visibility_off,
                                color: kButtonColor,
                              )),
                          hintText: "Renter Canteen ID",
                          validator:(value) {
                            if (value.isEmpty) {
                              return 'Please enter Canteen ID' ;
                            }
                            else if(_passwordTextEditController1.text!=_passwordTextEditController2.text){
                              return "ID does not match";
                            }
                            else if(value.length < 6 ){
                              return 'ID must be at least 6 characters';
                            }
                            return null;
                          },),
                        /*SizedBox(height: height*0.023,),
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              // isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 17,horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: kLightGreyColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusColor: kButtonColor,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: kButtonColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 1.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              iconEnabledColor: kButtonColor,
                              dropdownColor: kBackgroundColor,
                              style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                              hint: Text('User Type', style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: kLightGreyColor
                              ),),
                              validator: (value) =>
                              value == null
                                  ? 'please select your user type'
                                  : null,
                              value: _selectedUserType,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedUserType = newValue;
                                });
                              },
                              items: userType.map((location) {
                                return DropdownMenuItem(
                                  value: location,
                                  child: Text(location),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        _selectedUserType == "Teacher" ? Column(
                          children: [
                            SizedBox(height: height*0.023,),
                            CustomTextField(
                                controller: _teacherIdTextEditController,
                                validator: (value) {
                                  if (value.trim().isEmpty) {
                                    return 'Please enter your id';
                                  }
                                  return null;
                                },
                                hintText: "Teacher ID"),
                          ],
                        ):const SizedBox(),
                        SizedBox(height: height*0.023,),
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              // isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 17,horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: kLightGreyColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusColor: kButtonColor,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: kButtonColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 1.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              iconEnabledColor: kButtonColor,
                              dropdownColor: kBackgroundColor,
                              style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                              hint: Text('Gender', style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: kLightGreyColor
                              ),),
                              validator: (value) =>
                              value == null
                                  ? 'please select your gender'
                                  : null,
                              value: _selectedGender,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedGender = newValue;
                                });
                              },
                              items: gender.map((location) {
                                return DropdownMenuItem(
                                  value: location,
                                  child: Text(location),
                                );
                              }).toList(),
                            ),
                          ),
                        ),*/
                        SizedBox(height: height*0.013,),
                        Row(
                          children: [
                            Checkbox(
                                value: terms,
                                onChanged: (value){
                                  setState(() {
                                    terms = value!;
                                  });
                                }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("I accept the",style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: kLightGreyColor
                                ),),
                                const SizedBox(width: 5,),
                                GestureDetector(
                                  onTap: (){
                                    Get.to(() => const TermAndConditions());
                                  },
                                  child: Text("Terms & Conditions",
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w600,
                                        color: kButtonColor
                                    ),),
                                ),
                              ],
                            )
                          ],
                        ),

                      ],
                    )),
                const SizedBox(height: 35,),
                CustomButton(
                  title: 'Sign Up',
                  function: (){
                    if(_formKey.currentState!.validate()){
                      if(!terms){
                        Get.snackbar(
                          colorText:Colors.black,
                            "Accept terms and conditions",
                            "you need to accept the terms and condition before signin process");
                      }
                    }
                  },
                  buttonColor: kButtonColor,
                  textColor: Colors.black,
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Registered?",style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: kLightGreyColor
                    ),),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Text("Log In",
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                            color: kButtonColor
                        ),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
