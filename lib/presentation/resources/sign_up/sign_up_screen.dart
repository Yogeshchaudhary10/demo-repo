import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:text202/presentation/resources/routes_manager.dart';
import 'package:text202/presentation/resources/strings_manager.dart';

import '../../widgets/social_card.dart';
import '../assets_manager.dart';
import 'sign_up_controller/sign_up_controller.dart';

class SignFormClass extends StatefulWidget {
  const SignFormClass({Key? key}) : super(key: key);
  @override
  State<SignFormClass> createState() {
    return SignFormClassState();
  }
}

class SignFormClassState extends State<SignFormClass> {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: double.infinity,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    child: Icon(
                      Icons.person_rounded,
                      size: 100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mode),
                    labelText: AppString.userName,
                    hintText: AppString.userHint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  controller: username,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppString.kNameNullError;
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    labelText: AppString.email,
                    hintText: AppString.enterEmail,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppString.kEmailNullError;
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    labelText: AppString.phoneText,
                    hintText: AppString.phoneHint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  controller: phoneNo,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppString.kPhoneNumberNullError;
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.pin_drop),
                    labelText: AppString.locationText,
                    hintText: AppString.locationHint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  controller: location,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppString.kAddressNullError;
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: _signUpController.isObsecure.value,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: AppString.password,
                      hintText: AppString.enterPassword,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_signUpController.isObsecure.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _signUpController.changeObsecure();
                          });
                        },
                      )),
                  controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppString.kPassNullError;
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: "Confirm Password",
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      )),
                  controller: confirmPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    //Validate returns true if the form is valid, or false otherwise.

                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world, you'd often call as server or save the infomration in a database.
                      Navigator.pushReplacementNamed(context, Routes.signup);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, Routes.signup),
                    child: const SizedBox(
                      child: Text("Dude already a member? Login ",
                          style: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: ImageAssets.googleIcon,
                    press: () {},
                  ),
                  SocialCard(
                    icon: ImageAssets.faceBookIcon,
                    press: () {},
                  ),
                  SocialCard(
                    icon: ImageAssets.twitterIcon,
                    press: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
