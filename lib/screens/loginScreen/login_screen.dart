import 'package:e_commerce_app/appColors/app_colors.dart';
import 'package:e_commerce_app/mybottombar/my_bottom_bar.dart';
import 'package:e_commerce_app/styles/login_screen_styles.dart';
import 'package:e_commerce_app/svgimages/svg_images.dart';
import 'package:e_commerce_app/widgets/my_button_widget.dart';
import 'package:e_commerce_app/widgets/my_textfromfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../routes/routes.dart';
import '../../signup/signup_screen.dart';
import '../homepage/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget buildTopPart() {
    return Column(
      children: [
        Image.asset(
          "images/Logo.png",
          width: 350,
          height: 300,
        ),
        Column(
          children: [
            MyTextFromField(
              hintText: "E-mail",
              obscureText: false,
            ),
            MyTextFromField(
              hintText: "Password",
              obscureText: true,
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: MyButtonWidget(
                  text: "Sign in",
                  color: AppColors.baseBlackColor,
                  onPress: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: const MyBottomBar(),
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: MyButtonWidget(
                  text: "Sign up",
                  color: AppColors.baseDarkPinkColor,
                  onPress: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: const SignupScreen(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Forget Password?",
          style: LoginScreenStyles.forgotPasswordStyles,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildTopPart(),
              ],
            )
          ],
        ),
      )),
    );
  }
}
