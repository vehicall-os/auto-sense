import 'package:flutter/material.dart';

class SafetyRecallsScreen extends StatelessWidget {
  const SafetyRecallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text('Safety Recalls', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Vehicle Header Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  // Car Image
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 80, height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: NetworkImage('https://placeholder.com/car_f150.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 8,
                        backgroundColor: Color(0xFF1E293B), // border
                        child: CircleAvatar(radius: 6, backgroundColor: Colors.green),
                      )
                    ],
                  ),
                  const SizedBox(width: 16),
                  
                  // Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: Colors.blue.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                          child: const Text('PRIMARY', style: TextStyle(color: Colors.blue, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 4),
                        const Text('2018 Ford F-150', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                        const Text('VIN: •••••••X892', style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.warning, color: Colors.redAccent, size: 16),
                            const SizedBox(width: 4),
                            Text('2 Active Recalls Found', style: TextStyle(color: Colors.redAccent[100], fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _VehicleTab(label: '2018 Ford F-150', isSelected: true),
                  const SizedBox(width: 8),
                  _VehicleTab(label: '2021 Tesla Model 3', isSelected: false),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.add, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Section Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Attention Required', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(8)),
                  child: const Text('Updated 2h ago', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Active Recall Card (High Severity)
            Container(
               decoration: BoxDecoration(
                 color: const Color(0xFF1E293B),
                 borderRadius: BorderRadius.circular(16),
                 border: const Border(left: BorderSide(color: Colors.redAccent, width: 4)),
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(16),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const Text('HIGH SEVERITY • OPEN', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 10)),
                             Container(
                               padding: const EdgeInsets.all(8),
                               decoration: BoxDecoration(color: Colors.redAccent.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                               child: const Icon(Icons.videocam_off, color: Colors.redAccent, size: 20),
                             ),
                           ],
                         ),
                         const SizedBox(height: 4),
                         const Text('Rearview Camera Image Display', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                         const SizedBox(height: 16),
                         
                         _RiskActionRow(
                           icon: Icons.warning_amber,
                           label: 'Risk:',
                           text: 'Reduced visibility while reversing significantly increases crash risk.',
                         ),
                         const SizedBox(height: 12),
                         _RiskActionRow(
                           icon: Icons.build,
                           label: 'Action:',
                           text: 'Dealer will update image processing module software free of charge.',
                           iconColor: Colors.blue,
                         ),
                         const SizedBox(height: 16),

                         // AI Insight
                         Container(
                           padding: const EdgeInsets.all(12),
                           decoration: BoxDecoration(
                             color: Colors.blue.withOpacity(0.1),
                             borderRadius: BorderRadius.circular(12),
                             border: Border.all(color: Colors.blue.withOpacity(0.2)),
                           ),
                           child: const Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Icon(Icons.smart_toy, color: Colors.blue, size: 20),
                               SizedBox(width: 8),
                               Expanded(
                                 child: Text.rich(
                                   TextSpan(
                                     style: TextStyle(color: Colors.blue, fontSize: 12),
                                     children: [
                                       TextSpan(text: 'AI Insight: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                       TextSpan(text: 'This is critical for urban driving. We recommend resolving within 48 hours based on your frequent city parking.'),
                                     ],
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         const SizedBox(height: 16),

                         SizedBox(
                           width: double.infinity,
                           child: ElevatedButton(
                             onPressed: (){},
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.blue,
                               padding: const EdgeInsets.symmetric(vertical: 16),
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                             ),
                             child: const Text('Schedule Service', style: TextStyle(fontWeight: FontWeight.bold)),
                           ),
                         )
                       ],
                     ),
                   ),
                 ],
               ),
            ),
            const SizedBox(height: 16),

             // Recall Card 2 (Medium Severity)
            Container(
               decoration: BoxDecoration(
                 color: const Color(0xFF1E293B),
                 borderRadius: BorderRadius.circular(16),
                 border: const Border(left: BorderSide(color: Colors.orange, width: 4)),
               ),
               child: Padding(
                 padding: const EdgeInsets.all(16),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         const Text('MEDIUM SEVERITY • REMEDY AVAILABLE', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 10)),
                         Container(
                           padding: const EdgeInsets.all(8),
                           decoration: BoxDecoration(color: Colors.orange.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                           child: const Icon(Icons.water_drop, color: Colors.orange, size: 20),
                         ),
                       ],
                     ),
                     const SizedBox(height: 4),
                     const Text('Master Cylinder Leak', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                     const SizedBox(height: 16),
                     
                     _RiskActionRow(
                       icon: Icons.warning_amber,
                       label: 'Risk:',
                       text: 'Fluid leak may result in reduced braking performance to front wheels.',
                     ),
                     const SizedBox(height: 12),
                     _RiskActionRow(
                       icon: Icons.build,
                       label: 'Action:',
                       text: 'Replace Master Cylinder. Parts are currently in stock at nearby dealers.',
                       iconColor: Colors.blue,
                     ),
                     const SizedBox(height: 16),
                     
                     SizedBox(
                       width: double.infinity,
                       child: OutlinedButton(
                         onPressed: (){},
                         style: OutlinedButton.styleFrom(
                           foregroundColor: Colors.white,
                           side: const BorderSide(color: Colors.grey),
                           padding: const EdgeInsets.symmetric(vertical: 16),
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                         ),
                         child: const Text('Find Dealer', style: TextStyle(fontWeight: FontWeight.bold)),
                       ),
                     )
                   ],
                 ),
               ),
            ),
            const SizedBox(height: 16),
            
            // Footer Link
             Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                     children: [
                       Icon(Icons.history, color: Colors.grey),
                       SizedBox(width: 8),
                       Text('View 3 Completed Recalls', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                     ],
                   ),
                   Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Bottom Actions
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: (){}, 
                    icon: const Icon(Icons.open_in_new, size: 16),
                    label: const Text('NHTSA Database'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E293B),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                 Expanded(
                  child: ElevatedButton.icon(
                    onPressed: (){}, 
                    icon: const Icon(Icons.notifications_active, size: 16),
                    label: const Text('Alert Me'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _VehicleTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  const _VehicleTab({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class _RiskActionRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String text;
  final Color iconColor;

  const _RiskActionRow({
    required this.icon,
    required this.label,
    required this.text,
    this.iconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.grey, fontSize: 13, height: 1.4),
              children: [
                TextSpan(text: '$label ', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                TextSpan(text: text),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
