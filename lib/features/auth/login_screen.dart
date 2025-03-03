import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:horizon/core/config/theme/color_palette.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/extension/num_extension.dart';
import 'package:horizon/core/mixin/validator_mixin.dart';
import 'package:horizon/core/shared/widgets/appbar/common_appbar.dart';
import 'package:horizon/core/shared/widgets/button/common_button.dart';
import 'package:horizon/core/shared/widgets/textfield/common_textfield.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin, ValidatorMixin {
  bool isEmployee = true;

  late TabController _tabController;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Logo and Name

            40.hBox,
            // Login Card
            Container(
              constraints: BoxConstraints(maxWidth: context.w * 0.4),
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  24.hBox,
                  // Toggle buttons for Employee/Manager
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: TabBar(
                        labelColor: ColorPalette.whiteColor,
                        unselectedLabelColor: ColorPalette.blackColor,
                        labelStyle: context.bodyMedium
                            .copyWith(fontWeight: FontWeight.bold),
                        unselectedLabelStyle: context.bodyMedium,
                        indicator: BoxDecoration(
                          color: const Color(0xFF7C4DFF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorAnimation: TabIndicatorAnimation.elastic,
                        onTap: (index) {
                          setState(() {
                            isEmployee = index == 0;
                          });
                        },
                        tabs: [
                          Tab(
                            child: Text(
                              'Employee',
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Manager',
                              style: TextStyle(
                                color: isEmployee
                                    ? Colors.grey[800]
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                        controller: _tabController),
                  ),
                  24.hBox,
                  SizedBox(
                    height: context.h * 0.4,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Form(
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
                              CommonButton.buildElevatedButton(
                                  onPressed: () {
                                    
                                  },
                                  text: 'Login'),
                              16.hBox,
                              CommonButton.buildElevatedButton(
                                  onPressed: () {}, text: 'Sign Up'),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void isHidden() {
    setState(() {
      isEmployee = !isEmployee;
    });
  }
}
