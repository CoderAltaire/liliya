import 'package:com.example.liliya/hive_helper/hive_names.dart';
import 'package:com.example.liliya/models/user_data.dart';
import 'package:com.example.liliya/view/login/sign_in_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extenstion.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';
import '../../firebase_service/auth/auth_service.dart';
import 'help_us_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtCode = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isStay = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: TColor.primary),
                ),
                const SizedBox(height: 20),
                Text(
                  "Create Account",
                  style: TextStyle(
                    color: TColor.text,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Please fill in the form to continue",
                  style: TextStyle(color: TColor.subTitle, fontSize: 16),
                ),
                const SizedBox(height: 40),
                RoundTextField(
                  controller: txtFirstName,
                  hintText: "First  Name",
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 20),
                RoundTextField(
                  controller: txtLastName,
                  hintText: "Last Name",
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 20),
                RoundTextField(
                  controller: txtEmail,
                  hintText: "Email Address",
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 20),
                RoundTextField(
                  controller: txtMobile,
                  hintText: "Mobile Phone",
                  keyboardType: TextInputType.phone,
                  icon: Icons.phone_outlined,
                ),
                const SizedBox(height: 20),
                RoundTextField(
                  controller: txtCode,
                  hintText: "Group Special Code (optional)",
                  icon: Icons.group_outlined,
                ),
                const SizedBox(height: 20),
                RoundTextField(
                  controller: txtPassword,
                  hintText: "Password",
                  obscureText: true,
                  icon: Icons.lock_outline,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isStay = !isStay;
                        });
                      },
                      icon: Icon(
                        isStay
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color:
                            isStay
                                ? TColor.primary
                                : TColor.subTitle.withOpacity(0.3),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Please sign me up for the monthly newsletter.",
                        style: TextStyle(color: TColor.subTitle, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                RoundLineButton(
                  title: "Sign Up",
                  onPressed: () {
               UserData userdata = UserData(txtFirstName.text, txtLastName.text);
               HiveBoxes.userdatas.put('user', userdata);
                    AuthService.instance.signUpUser(
                      context,
                      txtEmail.text,
                      txtPassword.text,
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: TColor.subTitle, fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInView()),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: TColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
