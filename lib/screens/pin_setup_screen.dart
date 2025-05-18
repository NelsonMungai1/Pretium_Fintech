import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pin_verification_screen.dart';

class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({super.key});

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  final List<String> _pin = ['', '', '', ''];
  int _currentIndex = 0;
  bool _showSuccess = false;

  void _addDigit(String digit) {
    if (_currentIndex < 4) {
      setState(() {
        _pin[_currentIndex] = digit;
        _currentIndex++;
      });

      // If PIN is complete, show success message
      if (_currentIndex == 4) {
        setState(() {
          _showSuccess = true;
        });

        // Navigate to PIN verification screen after a delay
        Future.delayed(const Duration(seconds: 2), () {
          // Navigate to PIN verification screen
          Get.off(() => const PinVerificationScreen());
        });
      }
    }
  }

  void _removeDigit() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _pin[_currentIndex] = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B735F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Lock icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.lock,
                  color: Color(0xFF0B735F),
                  size: 30,
                ),
              ),
              const SizedBox(height: 24),
              // Title
              const Text(
                'Create a 4-digit PIN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              // PIN indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      color: _pin[index].isNotEmpty
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),
              // Subtitle
              const Text(
                'Your PIN will be required to access the app',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const Spacer(flex: 1),
              // Number pad
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumberButton('1'),
                      _buildNumberButton('2'),
                      _buildNumberButton('3'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumberButton('4'),
                      _buildNumberButton('5'),
                      _buildNumberButton('6'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumberButton('7'),
                      _buildNumberButton('8'),
                      _buildNumberButton('9'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 70, height: 70),
                      _buildNumberButton('0'),
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: IconButton(
                          onPressed: _removeDigit,
                          icon: const Icon(
                            Icons.backspace_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(flex: 1),
              // Success message
              if (_showSuccess)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Success, welcome back!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return SizedBox(
      width: 70,
      height: 70,
      child: TextButton(
        onPressed: () => _addDigit(number),
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
