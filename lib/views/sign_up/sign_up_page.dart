import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/app_routes.dart';
import 'sign_up_bloc.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _ecFirstName;
  late TextEditingController _ecLastName;
  late TextEditingController _ecEmail;
  late TextEditingController _ecPassword;
  late TextEditingController _ecPasswordConfirmation;
  late bool _hidePassword;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();
    _ecFirstName = TextEditingController(text: 'john');
    _ecLastName = TextEditingController(text: 'doe');
    _ecEmail = TextEditingController(text: 'john.doe@mail.com');
    _ecPassword = TextEditingController(text: 'PASSword@?!666');
    _ecPasswordConfirmation = TextEditingController(text: 'PASSword@?!666');
    _hidePassword = true;
  }

  @override
  void dispose() {
    _ecFirstName.dispose();
    _ecLastName.dispose();
    _ecEmail.dispose();
    _ecPassword.dispose();
    _ecPasswordConfirmation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
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
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Form(
                    key: _formKey,
                    child: BlocListener<SignUpBloc, SignUpState>(
                      listener: (context, state) {
                        if (state is Failed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.error)),
                          );
                        }

                        if (state is Loaded) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.signIn,
                            (_) => false,
                            // arguments: state.user,
                          );
                        }
                      },
                      child: BlocBuilder<SignUpBloc, SignUpState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: state is Loading ? true : false,
                                  controller: _ecFirstName,
                                  keyboardType: TextInputType.name,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    labelText: 'Nome',
                                  ),
                                  validator: (text) {
                                    if (text == null || text.trim().isEmpty) {
                                      return 'Campo obrigatório';
                                    }

                                    if (text.trim().length < 2) {
                                      return 'O nome deve conter ao menos 2 caracteres';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: state is Loading ? true : false,
                                  controller: _ecLastName,
                                  keyboardType: TextInputType.name,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    labelText: 'Sobrenome',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: state is Loading ? true : false,
                                  controller: _ecEmail,
                                  keyboardType: TextInputType.emailAddress,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    labelText: 'Email',
                                  ),
                                  validator: (text) {
                                    if (text == null || text.trim().isEmpty) {
                                      return 'Campo obrigatório';
                                    }

                                    if (!RegExp(r'.+@.+')
                                        .hasMatch(text.trim())) {
                                      return 'Email inválido';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: state is Loading ? true : false,
                                  controller: _ecPassword,
                                  obscureText: _hidePassword,
                                  keyboardType: TextInputType.emailAddress,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      onPressed: () => setState(() {
                                        _hidePassword = !_hidePassword;
                                      }),
                                      icon: _hidePassword
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                    ),
                                    labelText: 'Senha',
                                  ),
                                  validator: (text) {
                                    if (text == null || text.trim().isEmpty) {
                                      return 'Campo obrigatório';
                                    }

                                    if (text.trim().length < 6) {
                                      return 'A senha deve conter ao menos 6 caracteres';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: state is Loading ? true : false,
                                  controller: _ecPasswordConfirmation,
                                  obscureText: _hidePassword,
                                  keyboardType: TextInputType.emailAddress,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      onPressed: () => setState(() {
                                        _hidePassword = !_hidePassword;
                                      }),
                                      icon: _hidePassword
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                    ),
                                    labelText: 'Confirmação de Senha',
                                  ),
                                  validator: (text) => text != _ecPassword.text
                                      ? 'As senhas devem ser iguais'
                                      : null,
                                ),
                              ),
                              state is Loading
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 56,
                                        child: FilledButton(
                                          onPressed: () {
                                            final isFormValid = _formKey
                                                .currentState!
                                                .validate();

                                            if (isFormValid) {
                                              context
                                                  .read<SignUpBloc>()
                                                  .add(SignUpSubmitEvent(
                                                    firstName:
                                                        _ecFirstName.text,
                                                    lastName: _ecLastName.text,
                                                    email: _ecEmail.text,
                                                    password: _ecPassword.text,
                                                  ));
                                            }
                                          },
                                          child: const SizedBox(
                                            child: Text('CADASTRAR'),
                                          ),
                                        ),
                                      ),
                                    ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Text('Já tem cadastro?'),
                                  TextButton(
                                    child: const Text('Entrar'),
                                    onPressed: () => Navigator.of(context)
                                        .pushReplacementNamed(AppRoutes.signIn),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
