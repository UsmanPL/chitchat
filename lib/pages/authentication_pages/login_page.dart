import 'package:chitchat/constants/globals.dart';
import 'package:chitchat/pages/authentication_pages/registration_page.dart';
import 'package:chitchat/main_page.dart';
import 'package:chitchat/widgets/native_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool isPasswordVisible = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      top: sizeConfig.safeArea.top,
                      right: sizeConfig.width(.05),
                    ),
                    width: sizeConfig.width(.2),
                    height: sizeConfig.width(.1),
                    child: OutlinedButton(
                      onPressed: _goToRegistrationPage,
                      style: const ButtonStyle(
                        side: MaterialStatePropertyAll(
                          BorderSide(color: Colors.grey),
                        ),
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      ),
                      child: Text(
                        "Register",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  // top: sizeConfig.safeArea.top,
                  bottom: sizeConfig.height(.01),
                  left: sizeConfig.width(.05),
                  right: sizeConfig.width(.05),
                ),
                child: Text(
                  "Login to your account",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                  left: sizeConfig.width(.05),
                ),
                child: Text(
                  "Login to your account to chat with others.",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.04),
                ),
                child: Icon(
                  CupertinoIcons.chat_bubble_2_fill,
                  size: 88,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.01),
                  horizontal: sizeConfig.width(.04),
                ),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    label: Text("Email"),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.01),
                  horizontal: sizeConfig.width(.04),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    label: const Text("Password"),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: _updatePasswordVisibility,
                      child: Icon(isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: sizeConfig.safeArea.bottom + sizeConfig.height(.02),
                  horizontal: sizeConfig.width(.04),
                ),
                child: NativeButton(
                  title: "LOGIN",
                  onTap: _goToMainPage,
                ),
              ),
            ],
          ),
        ),
      );

  // Functions
  void _updatePasswordVisibility() =>
      setState(() => isPasswordVisible = !isPasswordVisible);

  void _goToRegistrationPage() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const RegistrationPage(),
        ),
      );

  void _goToMainPage() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainPage(),
        ),
      );

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
