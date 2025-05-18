import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final List<String> _pin = ['', '', '', ''];
  int _currentIndex = 0;
  bool _showSuccess = false;

  // For demonstration purposes only - in a real app, you would verify against stored PIN
  final List<String> _correctPin = ['1', '2', '3', '4'];

  void _addDigit(String digit) {
    if (_currentIndex < 4) {
      setState(() {
        _pin[_currentIndex] = digit;
        _currentIndex++;
      });

      // If PIN is complete, navigate to home screen immediately
      if (_currentIndex == 4) {
        // In a real app, you would verify the PIN here
        bool isPinCorrect = true; // Simplified for this example

        setState(() {
          _showSuccess = isPinCorrect;
        });

        // Navigate to home screen immediately when 4th digit is entered
        Get.offAll(() => const HomeScreen());
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
                'Enter your PIN',
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
