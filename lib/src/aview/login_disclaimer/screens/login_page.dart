import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/src/controller/settings/settings_cubit.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/static_text.dart';

final _settingsCubit = GetIt.I<SettingsCubit>();

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

  void _onTextChanged() {
    final text = _usernameController.text;
    if (text.isNotEmpty) {
      _settingsCubit.login(text);
      context.go('/disclaimer');
    }
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<SettingsCubit, SettingsState>(
      bloc: _settingsCubit,
      listener: (context, state) {
        if (state is! NotLoggedIn) {
          context.go('/home');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Spacings.widgetPaddingAll),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: Spacings.widgetHorizontal*5),
                  Image.asset(
                    'assets/images/VinoVeritas-Logo.png',
                    height: screenHeight / 3,
                  ),
                  const SizedBox(height: Spacings.widgetVertical*2),
                  Center(
                    child: SizedBox(
                      width: screenWidth / 2,
                      child: const Divider(
                        color: AppColors.primaryGrey,
                        thickness: 3,
                        endIndent: BorderSide.strokeAlignCenter,
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacings.widgetHorizontal),
                  const Text(
                    StaticText.appTitleTop,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Spacings.loginTextSize1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    StaticText.appTitleBottom,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Spacings.loginTextSize2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: Spacings.widgetHorizontal*5),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(Spacings.roundEnd)),
                      ),
                      labelText: StaticText.username,
                    ),
                    onSubmitted: (text) => _onTextChanged(),
                  ),
                  const SizedBox(height: Spacings.widgetHorizontal*2),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isButtonEnabled
                          ? AppColors.primaryRed
                          : AppColors.secondaryGrey,
                      padding: const EdgeInsets.symmetric(vertical: Spacings.widgetHorizontal*1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Spacings.roundEnd),
                      ),
                    ),
                    onPressed: _isButtonEnabled
                        ? _onTextChanged
                        : null,
                    child: const Text(
                      StaticText.letsGo,
                      style: TextStyle(
                        fontSize: Spacings.titleFontSize,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
