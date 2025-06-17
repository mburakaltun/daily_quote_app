import 'package:daily_quote_app/authentication/model/request/request_complete_reset_password.dart';
import 'package:daily_quote_app/authentication/service/authentication_service.dart';
import 'package:daily_quote_app/common/constants/routes.dart';
import 'package:daily_quote_app/common/extension/localization_extension.dart';
import 'package:daily_quote_app/common/utility/dialog_utility.dart';
import 'package:flutter/material.dart';

class CompleteResetPasswordScreen extends StatefulWidget {
  final String token;

  const CompleteResetPasswordScreen({super.key, required this.token});

  @override
  State<CompleteResetPasswordScreen> createState() => _CompleteResetPasswordScreenState();
}

class _CompleteResetPasswordScreenState extends State<CompleteResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authenticationService = AuthenticationService();

  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await _authenticationService.completeResetPassword(
        RequestCompleteResetPassword(token: widget.token, newPassword: _passwordController.text, confirmNewPassword: _confirmPasswordController.text),
      );

      if (!mounted) return;

      // Navigate to success screen
      Navigator.pushReplacementNamed(context, Routes.resetPasswordSuccess);
    } catch (e) {
      if (!mounted) return;
      DialogUtility.handleApiError(context: context, error: e, title: context.message.resetPasswordFailed);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
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

                    Text(
                      context.message.resetPasswordTitle,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      context.message.resetPasswordCompleteDescription,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // New Password field
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: context.message.resetPasswordNew,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      ),
                      obscureText: _obscurePassword,
                      validator: (value) {
                        if (value == null || value.length < 8) {
                          return context.message.resetPasswordNewHint;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Confirm Password field
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: context.message.resetPasswordConfirm,
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword = !_obscureConfirmPassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      ),
                      obscureText: _obscureConfirmPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.message.resetPasswordConfirmHint;
                        }
                        if (value != _passwordController.text) {
                          return context.message.resetPasswordMismatch;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),

                    // Reset Button
                    ElevatedButton(
                      onPressed: _isLoading ? null : _resetPassword,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 2,
                      ),
                      child: _isLoading
                          ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                          : Text(context.message.resetPasswordCompleteSubmit, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),

                    const SizedBox(height: 24),

                    // Back to login link for users who remember their password
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
