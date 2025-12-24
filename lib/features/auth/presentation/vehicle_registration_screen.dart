import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VehicleRegistrationScreen extends StatefulWidget {
  const VehicleRegistrationScreen({super.key});

  @override
  State<VehicleRegistrationScreen> createState() => _VehicleRegistrationScreenState();
}

class _VehicleRegistrationScreenState extends State<VehicleRegistrationScreen> {
  // Mock items
  String _selectedYear = '2023'; // Default for example
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        leading: BackButton(color: Colors.white, onPressed: () => context.go('/login')),
        title: const Text('Add Your Vehicle', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(onPressed: () => context.go('/driver/dashboard'), child: const Text('Skip', style: TextStyle(color: Colors.grey))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text('Step 1 of 3', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const Spacer(),
                  const Text('Vehicle Details', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(
                 value: 0.33,
                 backgroundColor: Colors.grey[800],
                 valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                 borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 24),
            
            // Image
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage('https://placeholder.com/dashboard_close.png'), // Dashboard close up
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16, left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue.withOpacity(0.3)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.auto_awesome, color: Colors.blue, size: 14),
                          SizedBox(width: 8),
                          Text('AI Diagnostics', style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            
            // Form
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Let’s set up your ride', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                  const SizedBox(height: 12),
                  Text(
                    'Add your vehicle details so our AI can start tracking its health and predict maintenance needs.',
                    style: TextStyle(color: Colors.grey[400], fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 32),
                  
                  // Form Fields
                  const Text('Year', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedYear,
                      isExpanded: true,
                      dropdownColor: const Color(0xFF1E293B),
                      underline: const SizedBox(),
                      style: const TextStyle(color: Colors.white),
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                      items: ['2023', '2022', '2021', '2020'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (val) => setState(() => _selectedYear = val!),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Make', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                             TextField(
                               style: const TextStyle(color: Colors.white),
                               decoration: InputDecoration(
                                 hintText: 'Ex. Tesla',
                                 hintStyle: TextStyle(color: Colors.grey[600]),
                                 filled: true,
                                 fillColor: const Color(0xFF1E293B),
                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                               ),
                             )
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                       Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Model', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                             TextField(
                               style: const TextStyle(color: Colors.white),
                               decoration: InputDecoration(
                                 hintText: 'Ex. Model 3',
                                 hintStyle: TextStyle(color: Colors.grey[600]),
                                 filled: true,
                                 fillColor: const Color(0xFF1E293B),
                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                               ),
                             )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Vehicle Identification Number (VIN)', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                      TextButton(onPressed: (){}, child: const Text('What\'s this?', style: TextStyle(color: Colors.blue, fontSize: 12))),
                    ],
                  ),
                  TextField(
                     style: const TextStyle(color: Colors.white),
                     decoration: InputDecoration(
                       hintText: '17-CHARACTER VIN',
                       hintStyle: TextStyle(color: Colors.grey[600]),
                       filled: true,
                       fillColor: const Color(0xFF1E293B),
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                       suffixIcon: const Icon(Icons.qr_code_scanner, color: Colors.blue),
                     ),
                   ),
                   const SizedBox(height: 8),
                   Row(
                     children: [
                       Icon(Icons.info, color: Colors.grey[600], size: 16),
                       const SizedBox(width: 8),
                       Expanded(child: Text('Usually found on the driver\'s side dashboard or door jamb.', style: TextStyle(color: Colors.grey[500], fontSize: 12))),
                     ],
                   ),
                   const SizedBox(height: 48),

                   SizedBox(
                     width: double.infinity,
                     child: ElevatedButton(
                       onPressed: () {
                         context.go('/driver/dashboard');
                       },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.blue,
                         padding: const EdgeInsets.symmetric(vertical: 20),
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                       ),
                       child: const Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('Connect Vehicle', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                           SizedBox(width: 8),
                           Icon(Icons.arrow_forward),
                         ],
                       ),
                     ),
                   )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
