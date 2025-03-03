import 'package:flutter/material.dart';
import 'package:horizon/core/extension/num_extension.dart';
import 'package:horizon/core/mixin/validator_mixin.dart';
import 'package:horizon/core/shared/widgets/button/common_button.dart';
import 'package:horizon/core/shared/widgets/textfield/common_textfield.dart';

class EmployeeLoginScreen extends StatefulWidget {
  const EmployeeLoginScreen({super.key});

  @override
  State<EmployeeLoginScreen> createState() => _EmployeeLoginScreenState();
}

class _EmployeeLoginScreenState extends State<EmployeeLoginScreen>
    with ValidatorMixin {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmployee = true;

  void isHidden() {
    setState(() {
      isEmployee = !isEmployee;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextField(
            hintText: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: isValidEmail,
          ),
          16.hBox,
          CommonTextField(
            hintText: 'Password',
            controller: passwordController,
            obscureText: true,
            changeObsecure: isHidden,
          ),
          16.hBox,
          CommonButton.buildElevatedButton(onPressed: () {}, text: 'Login'),
          16.hBox,
          CommonButton.buildElevatedButton(onPressed: () {}, text: 'Sign Up'),
        ],
      ),
    );
  }
}
