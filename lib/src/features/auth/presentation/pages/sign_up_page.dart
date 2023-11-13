import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/utils/constants/gaps.dart';
import 'package:mymny/src/utils/constants/ui_constants.dart';

class LoginOrSignupPage extends StatefulHookConsumerWidget {
  const LoginOrSignupPage({super.key});

  static const routeName = 'login-or-signup';
  static const routePath = '/login-or-signup';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginOrSignupPageState();
}

class _LoginOrSignupPageState extends ConsumerState<LoginOrSignupPage> {
  late ValueNotifier<bool> _isPasswordVisible;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = ValueNotifier(false);
    _formKey = GlobalKey<FormState>();
  }

  void submit() {}

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    const isLoading = false;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: kPaddingMd,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Create your\nAccount',
                style: textTheme.displaySmall,
              ),
              gapH36,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: kTextFieldDecorationDark.copyWith(
                        hintText: 'Full Name',
                      ),
                    ),
                    gapH16,
                    TextFormField(
                      controller: emailController,
                      decoration:
                          kTextFieldDecorationDark.copyWith(hintText: 'Email'),
                    ),
                    gapH16,
                    ValueListenableBuilder(
                      valueListenable: _isPasswordVisible,
                      builder: (_, bool isPasswordVisible, __) {
                        return TextFormField(
                          controller: passwordController,
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
              gapH16,
              FilledButton(
                onPressed: isLoading ? () {} : submit,
                child: const Text('Sign Up'),
                // child: isLoading ? loaderOnButton : const Text('Sign Up'),
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
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
