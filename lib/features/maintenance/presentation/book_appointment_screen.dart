import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Book Appointment', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vehicle Status Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.directions_car, color: Colors.blue, size: 16),
                    SizedBox(width: 8),
                    Text('2023 Tesla Model 3', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                  child: const Text('Online', style: TextStyle(color: Colors.green, fontSize: 10)),
                )
              ],
            ),
            const SizedBox(height: 16),

            // Warning Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                 color: const Color(0xFF1E1E1E),
                 borderRadius: BorderRadius.circular(12),
                 border: Border.all(color: Colors.orange.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.warning, color: Colors.orange, size: 16),
                            SizedBox(width: 8),
                            Text('ACTION REQUIRED', style: TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text('Brake Pad Warning', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 8),
                        const Text(
                          'Wear level critical (15%). AI analysis suggests replacement within 200 miles to ensure safety.',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 70, height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                      // Mock image
                      border: Border.all(color: Colors.grey[700]!),
                    ),
                     child: const Icon(Icons.disc_full, color: Colors.white30, size: 40),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Services
            const Text('Select Service', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const _ServiceOption(
              title: 'Brake Pad Replacement',
              subtitle: 'AI Recommended',
              price: '\$280',
              isSelected: true,
            ),
            const SizedBox(height: 12),
             const _ServiceOption(
              title: 'Full Vehicle Diagnostic',
              subtitle: 'Includes fluid check',
              price: '\$95',
            ),
            const SizedBox(height: 12),
             const _ServiceOption(
              title: 'Tire Rotation',
              price: '\$45',
            ),
            
            const SizedBox(height: 24),

            // Location
            const Text('Location', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('Map Placeholder', style: TextStyle(color: Colors.grey))),
            ),
             const SizedBox(height: 24),

             // Summary
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('Total Estimate', style: TextStyle(color: Colors.grey, fontSize: 12)),
                     Text('\$280.00', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                   ],
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     const Text('Oct 14 • 10:30 AM', style: TextStyle(color: Colors.grey, fontSize: 12)),
                     Text('TechAuto Hub', style: TextStyle(color: Colors.blue[400], fontSize: 12)),
                   ],
                 )
               ],
             ),

             const SizedBox(height: 16),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: () {},
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.blue,
                   padding: const EdgeInsets.all(16),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                 ),
                 child: const Text('Confirm Appointment', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
               ),
             )
          ],
        ),
      ),
    );
  }
}

class _ServiceOption extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String price;
  final bool isSelected;
  
  const _ServiceOption({required this.title, this.subtitle, required this.price, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: isSelected ? Border.all(color: Colors.blue) : null,
      ),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.check_box : Icons.check_box_outline_blank,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                if (subtitle != null)
                  Text(subtitle!, style: TextStyle(color: isSelected ? Colors.blue : Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(price, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
