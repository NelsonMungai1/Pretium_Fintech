import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/reset_password_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _codeController = TextEditingController();
  String _selectedCountry = 'Kenya';

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF0B735F)),
                onPressed: () => Get.back(),
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 24),

              // Verify Account title
              const Text(
                'Verify Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter the verification code sent to your email',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 32),

              // Country dropdown
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedCountry,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    borderRadius: BorderRadius.circular(12),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCountry = newValue!;
                      });
                    },
                    items: <String>['Kenya', 'Uganda', 'Tanzania', 'Nigeria']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Verification code field
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '1234',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    suffixIcon: Container(
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.shield_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Verify Account button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate code and navigate to reset password screen
                    if (_codeController.text.isNotEmpty) {
                      Get.to(() => const ResetPasswordScreen());
                    } else {
                      Get.snackbar(
                        'Error',
                        'Please enter the verification code',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0B735F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Verify Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Resend code row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the code?",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Resend code
                    },
                    child: const Text(
                      'Resend Code',
                      style: TextStyle(
                        color: Color(0xFF0B735F),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
