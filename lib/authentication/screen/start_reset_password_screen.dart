import 'package:daily_quote_app/common/extension/localization_extension.dart';
import 'package:flutter/material.dart';

import '../../common/constants/routes.dart';
import '../../common/utility/dialog_utility.dart';
import '../model/request/request_start_reset_password.dart';
import '../service/authentication_service.dart';

class StartResetPasswordScreen extends StatefulWidget {
  const StartResetPasswordScreen({super.key});

  @override
  State<StartResetPasswordScreen> createState() => _StartResetPasswordScreenState();
}

class _StartResetPasswordScreenState extends State<StartResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _authenticationService = AuthenticationService();

  String _email = '';
  bool _isLoading = false;
  bool _isSuccess = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
      _isSuccess = false;
    });

    try {
      await _authenticationService.startResetPassword(RequestStartResetPassword(email: _email));

      if (!mounted) return;

      setState(() {
        _isSuccess = true;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
    } finally {
      if (mounted && !_isSuccess) {
        setState(() => _isLoading = false);
      }
      DialogUtility.showSuccessDialog(
        context: context,
        title: context.message.resetPassword,
        message: context.message.resetPasswordResetLinkSent,
        onDismiss: () => Navigator.pushReplacementNamed(context, Routes.signIn),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Icon
                    Icon(Icons.lock_reset, size: 80, color: Theme.of(context).primaryColor.withOpacity(0.7)),
                    const SizedBox(height: 24),

                    // Title
                    Text(
                      context.message.resetPasswordTitle,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    // Description
                    Text(
                      context.message.resetPasswordDescription,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // Email field
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: context.message.resetPasswordEmail,
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.isEmpty || !value.contains('@')) {
                          return context.message.resetPasswordEmailHint;
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!.trim(),
                    ),
                    const SizedBox(height: 32),

                    // Reset Password button
                    ElevatedButton(
                      onPressed: _isLoading ? null : _resetPassword,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 2,
                      ),
                      child: _isLoading
                          ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                          : Text(context.message.resetPasswordSubmit, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),

                    const SizedBox(height: 24),

                    // Back to login link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(context.message.resetPasswordRemembered, style: TextStyle(color: Colors.grey[600])),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, Routes.signIn);
                          },
                          child: Text(
                            context.message.signIn,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
