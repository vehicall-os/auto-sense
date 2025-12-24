import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../storage/secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(seconds: 3)); // Display splash for 3 seconds
    final token = await SecureStorage().getToken();
    if (mounted) {
      if (token != null) {
        context.go('/driver/dashboard');
      } else {
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.network(
            'https://images.unsplash.com/photo-1617788138017-80ad40651399?q=80&w=2070&auto=format&fit=crop', // Dark sports car placeholder
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.6),
            colorBlendMode: BlendMode.darken,
          ),
          
          // Content
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Logo
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.directions_car, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        'AutoSense AI',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                
                const Spacer(),
                
                // AI Status Indicator
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black38,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       Icon(Icons.circle, color: Colors.green, size: 8),
                       SizedBox(width: 8),
                       Text('SYSTEM OPTIMAL • AI ACTIVE', style: TextStyle(color: Colors.white, fontSize: 10, letterSpacing: 1.5)),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Main Text
                const Text(
                  'Predictive Care',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                  ),
                ),
                const Text(
                  'For Your Car',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 24),

                // Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Harness the power of AI to detect issues before they happen. Monitor vehicle health in real-time.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[400], fontSize: 16, height: 1.5),
                  ),
                ),
                const SizedBox(height: 40),

                // Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 24, height: 6, decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(4))),
                    const SizedBox(width: 8),
                    Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle)),
                    const SizedBox(width: 8),
                    Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle)),
                  ],
                ),
                const SizedBox(height: 32),

                // Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => context.go('/login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Start Diagnostics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? ', style: TextStyle(color: Colors.grey)),
                    GestureDetector(
                      onTap: () => context.go('/login'),
                      child: const Text('Log In', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
