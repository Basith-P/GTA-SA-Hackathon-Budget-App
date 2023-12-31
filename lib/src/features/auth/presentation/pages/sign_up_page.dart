import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/auth/presentation/auth_controller.dart';
import 'package:mymny/src/utils/constants/ui_constants.dart';
import 'package:mymny/src/utils/widgets/gaps.dart';
import 'package:mymny/src/utils/widgets/loaders.dart';

class LoginOrSignupPage extends StatefulHookConsumerWidget {
  const LoginOrSignupPage({super.key, this.isSigningUp = false});

  final bool isSigningUp;

  static const routeName = 'login-or-signup';
  static const routePath = '/login-or-signup';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginOrSignupPageState();
}

class _LoginOrSignupPageState extends ConsumerState<LoginOrSignupPage> {
  late ValueNotifier<bool> _isPasswordVisible;
  late GlobalKey<FormState> _formKey;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool _isSigningUp = false;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = ValueNotifier(false);
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _isSigningUp = widget.isSigningUp;
  }

  void submit() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_isSigningUp) {
        ref.read(authControllerProvider.notifier).signup(
              email: _emailController.text,
              password: _passwordController.text,
              name: _nameController.text,
            );
      } else {
        ref.read(authControllerProvider.notifier).login(
              email: _emailController.text,
              password: _passwordController.text,
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: kPaddingSm,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${_isSigningUp ? 'Create' : 'Log in to'} your\nAccount',
                style: textTheme.displaySmall,
              ),
              gapH36,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (_isSigningUp) ...[
                      TextFormField(
                        key: const ValueKey('name'),
                        controller: _nameController,
                        decoration:
                            kTextFieldDecorationDark.copyWith(hintText: 'Name'),
                        textCapitalization: TextCapitalization.words,
                        validator: (val) =>
                            val!.isEmpty ? 'Name is required' : null,
                      ),
                      gapH12,
                    ],
                    TextFormField(
                      key: const ValueKey('email'),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          kTextFieldDecorationDark.copyWith(hintText: 'Email'),
                      validator: (val) =>
                          val!.isEmpty ? 'Email is required' : null,
                    ),
                    gapH12,
                    ValueListenableBuilder(
                      valueListenable: _isPasswordVisible,
                      builder: (_, bool isPasswordVisible, __) {
                        return TextFormField(
                          key: const ValueKey('password'),
                          controller: _passwordController,
                          decoration: kTextFieldDecorationDark.copyWith(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () => _isPasswordVisible.value =
                                  !_isPasswordVisible.value,
                              icon: Icon(
                                isPasswordVisible
                                    ? FluentIcons.eye_off_24_regular
                                    : FluentIcons.eye_24_regular,
                                // color: AppColors.lightText,
                              ),
                            ),
                          ),
                          obscureText: !isPasswordVisible,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              gapH12,
              FilledButton(
                onPressed: isLoading ? null : submit,
                child: isLoading
                    ? loaderOnButton
                    : Text(_isSigningUp ? 'Sign Up' : 'Log in'),
              ),
              gapH40,
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    '${_isSigningUp ? 'Already' : "Don't"} have an account?',
                    style: textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  gapW4,
                  TextButton(
                    onPressed: () =>
                        setState(() => _isSigningUp = !_isSigningUp),
                    child: Text(
                      _isSigningUp ? 'Log in' : 'Sign up',
                      style: textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _isPasswordVisible.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
