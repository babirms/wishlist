import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:wishlist/features/auth/presentation/cubit/register/register_state.dart';
import 'package:wishlist/features/auth/presentation/widgets/password_input_widget.dart';
import 'package:wishlist/shared/ui/widgets/buttons/back_button_widget.dart';
import 'package:wishlist/shared/ui/widgets/inputs/default_input_widget.dart';
import 'package:wishlist/shared/ui/widgets/texts/page_title_widget.dart';
import 'package:wishlist/shared/ui/widgets/buttons/primary_button_widget.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isValid = false;

  String? isEmailValid;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) async {
          if (state is RegisterSuccess) {
            await Navigator.of(context).pushNamedAndRemoveUntil(
              '/home',
              arguments: state.user,
              (Route<dynamic> route) => false,
            );
          } else if (state is RegisterEmailAlreadyInUseError) {
            setState(() {
              isEmailValid = state.errorMessage;
            });
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            if (state is RegisterLoading || state is RegisterSuccess) {
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        DefaultInputwWidget(
                          controller: nameController,
                          label: 'Nome Completo',
                          validator: (value) =>
                              EmptyFieldValidator.validateEmptyField(
                                  nameController.text),
                        ),
                        DefaultInputwWidget(
                          controller: emailController,
                          label: 'Email',
                          forceErrorText: isEmailValid,
                          onChanged: (p0) => setState(() {
                            isEmailValid = null;
                          }),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => EmailValidator.validateEmail(
                              emailController.text),
                        ),
                        PasswordInputWidget(
                          label: 'Senha',
                          controller: passwordController,
                          validator: (value) =>
                              PasswordValidator.validatePassword(
                                  passwordController.text),
                        ),
                        PasswordInputWidget(
                          label: 'Confirmar Senha',
                          controller: confirmPasswordController,
                          validator: (value) =>
                              PasswordValidator.validateConfirmPassword(
                            passwordController.text,
                            confirmPasswordController.text,
                          ),
                        ),
                        const SizedBox(height: 36),
                        PrimaryButtonWidget(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await context.read<RegisterCubit>().register(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                  );
                            }
                          },
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
    );
  }
}
