import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../storage/secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() => _isLoading = true);
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 1500));
    await SecureStorage().saveToken('mock_token_123');
    setState(() => _isLoading = false);
    if (mounted) {
      context.go('/driver/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Image Area
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?q=80&w=2070&auto=format&fit=crop'), // White SUV side profile
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                   Container(
                     decoration: BoxDecoration(
                       gradient: LinearGradient(
                         begin: Alignment.topCenter,
                         end: Alignment.bottomCenter,
                         colors: [Colors.transparent, const Color(0xFF0F172A)],
                         stops: const [0.6, 1.0],
                       ),
                     ),
                   ),
                   const Positioned(
                     top: 60, left: 16,
                     child: Text('9:41', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                   ),
                   // Badge scanning effect mock
                   Positioned(
                     right: 30, top: 120,
                     child: Container(
                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                       decoration: BoxDecoration(
                         color: Colors.white.withOpacity(0.1),
                         borderRadius: BorderRadius.circular(12),
                         border: Border.all(color: Colors.white24),
                       ),
                       child: const Row(
                         children: [
                            Icon(Icons.analytics, color: Colors.blue, size: 16),
                            SizedBox(width: 8),
                            Text('SCANNING...', style: TextStyle(color: Colors.blue, fontSize: 10, fontWeight: FontWeight.bold)),
                         ],
                       ),
                     ),
                   )
                ],
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                   Container(
                     padding: const EdgeInsets.all(16),
                     decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(16)),
                     child: const Icon(Icons.directions_car, color: Colors.white, size: 32),
                   ),
                   const SizedBox(height: 16),
                   RichText(
                     text: const TextSpan(
                       style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                       children: [
                         TextSpan(text: 'AutoSense', style: TextStyle(color: Colors.white)),
                         TextSpan(text: '.ai', style: TextStyle(color: Colors.blue)),
                       ],
                     ),
                   ),
                   const SizedBox(height: 16),
                   Text(
                     'Predictive maintenance & smart diagnostics for the modern vehicle.',
                     textAlign: TextAlign.center,
                     style: TextStyle(color: Colors.grey[400], fontSize: 16),
                   ),
                   const SizedBox(height: 48),

                   // Create Account Button
                   SizedBox(
                     width: double.infinity,
                     child: ElevatedButton(
                       onPressed: () {
                         context.go('/onboarding/vehicle');
                       }, 
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.blue,
                         padding: const EdgeInsets.symmetric(vertical: 18),
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                       ),
                       child: const Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('Create Account', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                           SizedBox(width: 8),
                           Icon(Icons.arrow_forward, size: 20),
                         ],
                       ),
                     ),
                   ),
                   const SizedBox(height: 16),

                   // Log In Button
                   SizedBox(
                     width: double.infinity,
                     child: OutlinedButton(
                       onPressed: _login,
                       style: OutlinedButton.styleFrom(
                         foregroundColor: Colors.white,
                         side: const BorderSide(color: Colors.grey),
                         padding: const EdgeInsets.symmetric(vertical: 18),
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                       ),
                       child: _isLoading 
                        ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : const Text('Log In', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                     ),
                   ),
                   const SizedBox(height: 32),
                   
                   Row(
                     children: [
                       Expanded(child: Divider(color: Colors.grey[800])),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 16),
                         child: Text('OR CONTINUE WITH', style: TextStyle(color: Colors.grey[600], fontSize: 10, fontWeight: FontWeight.bold)),
                       ),
                       Expanded(child: Divider(color: Colors.grey[800])),
                     ],
                   ),
                   const SizedBox(height: 24),

                   Row(
                     children: [
                       Expanded(
                         child: OutlinedButton.icon(
                            onPressed: (){},
                            icon: const Icon(Icons.g_mobiledata, size: 28), // Mock Google icon replacement
                            label: const Text('Google', style: TextStyle(color: Colors.white)),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: BorderSide(color: Colors.grey[800]!),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                         ),
                       ),
                       const SizedBox(width: 16),
                       Expanded(
                         child: OutlinedButton.icon(
                            onPressed: (){},
                            icon: const Icon(Icons.apple, size: 24),
                            label: const Text('Apple', style: TextStyle(color: Colors.white)),
                             style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: BorderSide(color: Colors.grey[800]!),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(height: 40),
                   Center(child: Text('Continue as Guest', style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold))),
                   const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
