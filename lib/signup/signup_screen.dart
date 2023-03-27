import 'package:e_commerce_app/appColors/app_colors.dart';
import 'package:e_commerce_app/styles/signup_screen_styles.dart';
import 'package:e_commerce_app/svgimages/svg_images.dart';
import 'package:e_commerce_app/widgets/my_button_widget.dart';
import 'package:e_commerce_app/widgets/my_textfromfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
Widget buildTopPart(){
    return Column(
      children: [
      Image.asset(
      "images/Logo.png",
      width: 350,
      height: 150,
    ),
      MyTextFromField(
        hintText: "Full Name",
         obscureText: false,
        ),
        MyTextFromField(
          hintText: "E-mail",
          obscureText: false,
        ),
        MyTextFromField(
          hintText: "Password",
          obscureText: true,
        ),
        MyTextFromField(
          hintText: "Confirm Password",
          obscureText: true,
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: MyButtonWidget(
            onPress: (){},
            color: AppColors.baseDarkPinkColor,
            text: "Create an account",
          ),
        ),
         const SizedBox(
          height: 20,
        ),
        RichText(text: const TextSpan(
          text: "By Signing up you agreed to our\n\t",
          style: SignupScreenStyles.signInAgreesStyle,
          children: <TextSpan>[
            TextSpan(
              text: "Terms",
              style: SignupScreenStyles.termsTextStyle,
            ),
            TextSpan(
              text: "and\t",
              style: SignupScreenStyles.andTextStyle,
            ),
            TextSpan(
              text: "Conditions of Use",
              style: SignupScreenStyles.conditionsOfUseStyle,
            ),
          ]


        ),
        ),
      ],
      );
    }
    Widget buildSocialButton({required Widget child, required Function onPressed}) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 0.5,
          color: AppColors.baseGrey40Color,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      onPressed: () {},
      child: child,
    );
  }
Widget buildBottomPart(){
  return SizedBox(
    height: 250,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          " Or signin with social accounts",
          style: SignupScreenStyles.signInSocialStyle,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSocialButton(
                  onPressed: (){},
                  child: SvgPicture.asset(
                    SvgImages.facebook,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
              ),
              buildSocialButton(
                onPressed: (){},
                child: SvgPicture.asset(
                  SvgImages.google,
                  color: AppColors.baseBlackColor,
                  width: 45,
                ),
              ),
              buildSocialButton(
                onPressed: (){},
                child: SvgPicture.asset(
                  SvgImages.twitter,
                  color: AppColors.baseBlackColor,
                  width: 45,
                ),
              ),
              // Material(
              //     shape: OutlineInputBorder(
              //     borderSide:  const BorderSide(
              //       width: 0.5,
              //       color: AppColors.baseGrey40Color,
              //     ),
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   child: SvgPicture.asset(
              //       SvgImages.facebook,
              //     color: AppColors.baseBlackColor,
              //     width: 45,
              //   ),
              // ),
            ],
          ),



        ),
        Container(
          margin: const EdgeInsets.all(20.0),
          child: MaterialButton(
            onPressed: (){},
            color: AppColors.baseGrey10Color,
            height: 55,
            elevation: 0,
            child: const Center(
              child: Text(
                "Sign up",
                style: SignupScreenStyles.signUpButtonTextStyle,
              ),
            ),

          ),
        ),
      ],
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.baseBlackColor,
      ),
      body: SafeArea(child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          buildTopPart(),
          buildBottomPart(),
        ],
      )),
    );
  }
}

