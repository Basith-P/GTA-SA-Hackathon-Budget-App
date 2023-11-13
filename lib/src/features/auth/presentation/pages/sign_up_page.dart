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

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = ValueNotifier(false);
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void submit() {
    if (_formKey.currentState?.validate() ?? false) {
      if (widget.isSigningUp) {
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
                '${widget.isSigningUp ? 'Create' : 'Log in to'} your\nAccount',
                style: textTheme.displaySmall,
              ),
              gapH36,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration:
                          kTextFieldDecorationDark.copyWith(hintText: 'Name'),
                      validator: (val) =>
                          val!.isEmpty ? 'Name is required' : null,
                    ),
                    gapH12,
                    TextFormField(
                      controller: _emailController,
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
                    : Text(widget.isSigningUp ? 'Sign Up' : 'Log in'),
              ),
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
