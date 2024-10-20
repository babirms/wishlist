import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:wishlist/features/auth/presentation/cubit/login/login_state.dart';
import 'package:wishlist/shared/ui/widgets/buttons/back_button_widget.dart';
import 'package:wishlist/shared/ui/widgets/buttons/primary_button_widget.dart';
import 'package:wishlist/shared/ui/widgets/default_input_widget.dart';
import 'package:wishlist/shared/ui/widgets/page_title_widget.dart';
import 'package:wishlist/shared/validators/email_validator.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                    'Email para redefinição de senha enviado com sucesso!'),
                duration: Duration(seconds: 4)));
            Navigator.pop(context);
          } else if (state is ResetPasswordError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
          if (state is ResetPasswordLoading || state is ResetPasswordSuccess) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtonWidget(onPressed: () => Navigator.of(context).pop()),
                const PageTitleWidget(
                  title: 'Resetar senha',
                  subtitle:
                      'Insira seu email e enviaremos um link para você redefinir sua senha',
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultInputwWidget(
                        controller: emailController,
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            EmailValidator.validateEmail(emailController.text),
                      ),
                      const SizedBox(height: 36),
                      PrimaryButtonWidget(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await context.read<LoginCubit>().resetPassword(
                                  email: emailController.text,
                                );
                          }
                        },
                        label: 'Enviar email',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
