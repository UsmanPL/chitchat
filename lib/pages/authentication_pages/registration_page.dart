import 'package:chitchat/pages/authentication_pages/login_page.dart';
import 'package:flutter/material.dart';
import '../../constants/globals.dart';
import '../../widgets/native_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
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
                      onPressed: _goToLoginPage,
                      style: const ButtonStyle(
                        side: MaterialStatePropertyAll(
                          BorderSide(color: Colors.grey),
                        ),
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      ),
                      child: Text(
                        "Login",
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
                  "Set up your account ✍🏻",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                  left: sizeConfig.width(.05),
                  bottom: sizeConfig.height(.01),
                ),
                child: Text(
                  "Create an account so you can start chatting.",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.01),
                  horizontal: sizeConfig.width(.04),
                ),
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    label: Text("First Name"),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.01),
                  horizontal: sizeConfig.width(.04),
                ),
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    label: Text("Last Name"),
                    prefixIcon: Icon(Icons.person),
                  ),
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
                  vertical: sizeConfig.height(.01),
                  horizontal: sizeConfig.width(.04),
                ),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    label: const Text("Confirm Password"),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: _updateConfirmPasswordVisibility,
                      child: Icon(isConfirmPasswordVisible
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
                  child: const Text("REGISTER"),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      );

  // Functions

  void _updatePasswordVisibility() =>
      setState(() => isPasswordVisible = !isPasswordVisible);

  void _updateConfirmPasswordVisibility() =>
      setState(() => isConfirmPasswordVisible = !isConfirmPasswordVisible);

  void _goToLoginPage() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginPage(),
        ),
      );
}
