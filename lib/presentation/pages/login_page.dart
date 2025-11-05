import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ride_hailing/presentation/widgets/custom_btn.dart';
import 'package:ride_hailing/presentation/widgets/custom_text_field.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:ride_hailing/services/auth_service.dart';
import 'package:ride_hailing/domain/auth/auth_model.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(title: const Text('Login')),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'True Digital Protection',
                    style: largeTextRubik().copyWith(
                      fontWeight: FontWeight.w500,
                      color: boldTextColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Protect everyone you love from scams and online threats',
                    style: mediumTextRubik().copyWith(
                      fontWeight: FontWeight.w300,
                      color: lightTextColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: 'Email Address',
                    controller: _emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Email is required';
                      final re = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                      if (!re.hasMatch(v)) return 'Enter a valid email';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Password',
                    controller: _passwordController,
                    obscureText: true,
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Password is required';
                      if (v.length < 6) return 'Min 6 characters';
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    size: size,
                    onTap: () {
                      final form = _formKey.currentState;
                      if (form != null && form.validate()) {
                        context.read<AuthService>().setAuth(
                              AuthModel(token: 'mock-token'),
                            );
                      }
                    },
                    text: 'Log in',
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteGenerator.registerPage);
                      },
                      child: Text(
                        "Don't have an account? Sign up",
                        style: normalTextRubik().copyWith(color: lightTextColor),
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

