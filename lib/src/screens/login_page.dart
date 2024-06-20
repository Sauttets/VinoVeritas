import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/util/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_checkIfButtonShouldBeEnabled);
  }

  void _checkIfButtonShouldBeEnabled() {
    setState(() {
      _isButtonEnabled = _usernameController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _usernameController.removeListener(_checkIfButtonShouldBeEnabled);
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 50), // To ensure there is some space at the top
                Image.asset(
                  'assets/images/VinoVeritas-Logo.png',
                  height: 300,
                ),
                const SizedBox(height: 20),
                const Center(
                  child: SizedBox(
                    width: 220, // Adjust this value to set the width of the divider
                    child: Divider(
                      color: Colors.grey,
                      thickness: 3,
                      endIndent: BorderSide.strokeAlignCenter,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'V  I  N  O',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'VERITAS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 80), // Added extra space before the TextField
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isButtonEnabled ? AppColors.primaryRed : AppColors.secondaryGrey,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: _isButtonEnabled
                      ? () {
                          context.go('/home'); // Navigate to the HomePage
                        }
                      : null,
                  child: const Text(
                    'Los Gehts!',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primaryWhite, // Text color
                    ),
                  ),
                ),
                const SizedBox(height: 20), // To replace the Spacer
              ],
            ),
          ),
        ),
      ),
    );
  }
}
