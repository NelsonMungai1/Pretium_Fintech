import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  String _userName = "Nelson";
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation setup for skeleton loading
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(begin: 0.4, end: 0.6).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.repeat(reverse: true);

    // Simulate loading data
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        _animationController.stop();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            _buildAppBar(),

            // Main content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Wallet balance card
                    _buildWalletCard(),
                    const SizedBox(height: 20),

                    // Financial services
                    _buildFinancialServices(),
                    const SizedBox(height: 20),

                    // Recent transactions
                    _buildRecentTransactions(),
                  ],
                ),
              ),
            ),

            // Bottom navigation
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      color: const Color(0xFF0B735F),
      child: Row(
        children: [
          // User avatar
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Text(
              _userName.isNotEmpty ? _userName[0] : "U",
              style: const TextStyle(
                color: Color(0xFF0B735F),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Greeting - left aligned by default in Row
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Ensure left alignment
              children: [
                Row(
                  children: [
                    const Text(
                      "Hello, ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      _userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 6.0),
                      child: Icon(
                        Icons.waving_hand,
                        color: Colors.amber,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Notification icon
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildWalletCard() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF0B735F).withOpacity(0.8),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Wallet icon
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                ),
              ),

              // Eye icon
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Wallet balance label
          const Text(
            "Wallet Balance",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),

          // Balance amount
          const Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "KES",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4),
              Text(
                "0.00",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // USD conversion
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              "\$ 0.00",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialServices() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Financial Services",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "Kenya",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0B735F),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: const Color(0xFF0B735F),
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Service options - grid layout to match the image
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            childAspectRatio: 0.85,
            crossAxisSpacing: 8,
            mainAxisSpacing: 16,
            children: [
              _buildServiceItem(
                icon: Icons.send,
                label: "Send Money",
                color: const Color(0xFF0B735F),
              ),
              _buildServiceItem(
                icon: Icons.shopping_basket_outlined,
                label: "Buy Goods",
                color: const Color(0xFF0B735F),
              ),
              _buildServiceItem(
                icon: Icons.receipt_long,
                label: "Paybill",
                color: const Color(0xFF0B735F),
              ),
              _buildServiceItem(
                icon: Icons.phone_android,
                label: "Airtime",
                color: const Color(0xFF0B735F),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            // Updated color to match the image - lighter teal color
            color: const Color(0xFFE6F3F1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            // Updated color to match the image - darker teal color
            color: const Color(0xFF0B735F),
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRecentTransactions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Recent transactions",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "See all",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF0B735F),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Transactions list or empty state
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _isLoading
              ? _buildTransactionsSkeleton()
              : _buildEmptyTransactions(),
        ),
      ],
    );
  }

  Widget _buildTransactionsSkeleton() {
    return Column(
      key: const ValueKey('skeleton'),
      children: List.generate(
        3,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(_animation.value),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Container(
                          width: 120,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(_animation.value),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Container(
                          width: 80,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(_animation.value),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    width: 60,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(_animation.value),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyTransactions() {
    return Container(
      key: const ValueKey('empty'),
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Icon(
            Icons.receipt_long,
            size: 48,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          const Text(
            "No recent transactions",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(
              Icons.account_balance_wallet,
              color: Color(0xFF0B735F),
            ),
            onPressed: () {},
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF0B735F),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
