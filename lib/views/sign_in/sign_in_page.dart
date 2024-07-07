import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/app_routes.dart';
import 'sign_in_bloc.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _ecEmail;
  late TextEditingController _ecPassword;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();
    _ecEmail = TextEditingController(text: 'john.doe@mail.com');
    _ecPassword = TextEditingController(text: 'PASSword@?!666');
  }

  @override
  void dispose() {
    _ecEmail.dispose();
    _ecPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is Failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }

        if (state is Loaded) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.signUp,
            (_) => false,
            // arguments: state.user,
          );
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: SizedBox(
                        height: 128,
                        width: 128,
                        // child: SvgPicture.asset(AppAssets.signUpImage),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 4.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 4.0,
                            ),
                            child: Text(
                              'Informe seu email para',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              'Acessar cadastro',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 8.0,
                              ),
                              child: TextFormField(
                                readOnly: state is Loading ? true : false,
                                controller: _ecEmail,
                                keyboardType: TextInputType.emailAddress,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.email),
                                  labelText: 'Email',
                                ),
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return 'Campo obrigatório';
                                  }

                                  if (!RegExp(r'.+@.+').hasMatch(text.trim())) {
                                    return 'Email inválido';
                                  }

                                  return null;
                                },
                              ),
                            ),
                            state is Loading
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 4.0,
                                    ),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 56,
                                      child: const FilledButton(
                                        onPressed: null,
                                        child: SizedBox(
                                          height: 28,
                                          width: 28,
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 4.0,
                                    ),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 56,
                                      child: FilledButton(
                                        onPressed: () {
                                          final isValid =
                                              _formKey.currentState!.validate();

                                          if (isValid) {
                                            context
                                                .read<SignInBloc>()
                                                .add(SignInSubmitEvent(
                                                  email: _ecEmail.text,
                                                  password: _ecPassword.text,
                                                ));
                                          }
                                        },
                                        child: const SizedBox(
                                          child: Text('PRÓXIMO'),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text('Não possui cadastro?'),
                          TextButton(
                            onPressed: state is Loading
                                ? null
                                : () => Navigator.of(context)
                                    .pushReplacementNamed(AppRoutes.signUp),
                            child: const Text('Cadastrar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
