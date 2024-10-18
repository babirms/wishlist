import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:wishlist/features/auth/presentation/cubit/login/login_state.dart';
import 'package:wishlist/features/auth/presentation/widgets/password_input_widget.dart';
import 'package:wishlist/shared/ui/custom_colors.dart';
import 'package:wishlist/shared/ui/widgets/buttons/secondary_button_widget.dart';

import 'package:wishlist/shared/ui/widgets/default_input_widget.dart';
import 'package:wishlist/shared/ui/widgets/page_title_widget.dart';
import 'package:wishlist/shared/ui/widgets/buttons/primary_button_widget.dart';
import 'package:wishlist/shared/validators/email_validator.dart';
import 'package:wishlist/shared/validators/empty_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginSuccess) {
            await Navigator.of(context).popAndPushNamed('/products-list');
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PageTitleWidget(
                    title: 'Wishlist',
                    subtitle: 'Entre em sua conta',
                    titleSize: 64,
                    subtitleSize: 24,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultInputwWidget(
                          controller: emailController,
                          label: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => EmailValidator.validateEmail(
                              emailController.text),
                        ),
                        PasswordInputWidget(
                          label: 'Senha',
                          controller: passwordController,
                          validator: (value) =>
                              EmptyFieldValidator.validateEmptyField(
                                  passwordController.text),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: InkWell(
                              onTap: () async {
                                _formKey.currentState!.reset();
                                await Navigator.of(context)
                                    .pushNamed('/reset-password');
                              },
                              child: Text(
                                'Esqueceu sua senha?',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      CustomColors.primaryPink.withOpacity(0.7),
                                  decorationThickness: 1.5,
                                  color:
                                      CustomColors.primaryPink.withOpacity(0.7),
                                ),
                              ),
                            )),
                        const SizedBox(height: 36),
                        PrimaryButtonWidget(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await context.read<LoginCubit>().login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                            }
                          },
                          label: 'Login',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  const Divider(),
                  Container(
                    margin: const EdgeInsets.only(top: 36, bottom: 16),
                    child: const Text(
                      'Ainda não tem uma conta?',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SecondaryButtonWidget(
                    label: 'Cadastre-se',
                    onPressed: () async {
                      _formKey.currentState!.reset();

                      await Navigator.of(context).pushNamed('/register');
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
