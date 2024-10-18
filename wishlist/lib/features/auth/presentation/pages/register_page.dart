import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:wishlist/features/auth/presentation/cubit/auth_state.dart';
import 'package:wishlist/features/auth/presentation/widgets/password_input_widget.dart';
import 'package:wishlist/shared/service_injector.dart';
import 'package:wishlist/shared/ui/widgets/back_button_widget.dart';
import 'package:wishlist/shared/ui/widgets/default_input_widget.dart';
import 'package:wishlist/shared/ui/widgets/page_title_widget.dart';
import 'package:wishlist/shared/ui/widgets/primary_button_widget.dart';
import 'package:wishlist/shared/validators/email_validator.dart';
import 'package:wishlist/shared/validators/empty_field_validator.dart';
import 'package:wishlist/shared/validators/password_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final authCubit = Sl.get<AuthCubit>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isValid = false;

  void checkFormValidity() {
    setState(() {
      isValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => authCubit,
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButtonWidget(
                        onPressed: () => Navigator.of(context).pop()),
                    const PageTitleWidget(
                      title: 'Cadastre-se',
                      subtitle: 'Crie uma conta para continuar',
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          DefaultInputwWidget(
                            controller: nameController,
                            label: 'Nome Completo',
                            validator: (value) =>
                                EmptyFieldValidator.validateEmptyField(
                                    nameController.text),
                            onUnfocus: () => checkFormValidity(),
                          ),
                          DefaultInputwWidget(
                            controller: emailController,
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => EmailValidator.validateEmail(
                                emailController.text),
                            onUnfocus: () => checkFormValidity(),
                          ),
                          PasswordInputWidget(
                            label: 'Senha',
                            controller: passwordController,
                            validator: (value) =>
                                PasswordValidator.validatePassword(
                                    passwordController.text),
                            onUnfocus: () => checkFormValidity(),
                          ),
                          PasswordInputWidget(
                            label: 'Confirmar Senha',
                            controller: confirmPasswordController,
                            validator: (value) =>
                                PasswordValidator.validateConfirmPassword(
                              passwordController.text,
                              confirmPasswordController.text,
                            ),
                            onUnfocus: () => checkFormValidity(),
                          ),
                          const SizedBox(height: 36),
                          PrimaryButtonWidget(
                            onPressed: isValid
                                ? () async {
                                    await authCubit.register(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                    );
                                  }
                                : null,
                            label: 'Cadastrar',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
