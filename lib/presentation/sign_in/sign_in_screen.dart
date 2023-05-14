import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text202/presentation/resources/assets_manager.dart';
import 'package:text202/presentation/resources/color_manager.dart';
import 'package:text202/presentation/resources/strings_manager.dart';
import 'package:text202/presentation/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:text202/presentation/widgets/social_card.dart';

import '../resources/routes_manager.dart';
import '../resources/size_config.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  State<SignInScreen> createState() => _LoginFormClassState();
}

class _LoginFormClassState extends State<SignInScreen> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  // bool _isObscure = true;
  String passBackData = '';
  final _formKey = GlobalKey<FormState>();
  final SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(
                  child: Icon(
                    Icons.person_rounded,
                    size: 200,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
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
              child: Obx(
                (() => TextFormField(
                      obscureText: _signInController.isObsecure.value,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.key),
                          labelText: AppString.password,
                          hintText: AppString.enterPassword,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(_signInController.isObsecure.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              _signInController.changeObsecure();
                            },
                          )),
                      controller: password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppString.kPassNullError;
                        }
                        return null;
                      },
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: ColorManager.kButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world, you'd oftern call as server aor save the infomration in a database.
                    // Navigator.pushReplacementNamed(context, Routes.FirstScreen);
                    Navigator.pushNamed(context, Routes.home);
                  }
                },
                child: const Text(
                  AppString.signIn,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: SizedBox(
                  child: Text(AppString.forgotPassword,
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.signup);
                  },
                  child: const SizedBox(
                    child: Text(AppString.noAccount,
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
    );
  }
}
