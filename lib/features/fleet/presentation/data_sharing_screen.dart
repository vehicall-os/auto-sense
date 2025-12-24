import 'package:flutter/material.dart';

class DataSharingScreen extends StatelessWidget {
  const DataSharingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Data Sharing', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.help_outline), onPressed: (){}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Secure Sharing', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
             const SizedBox(height: 8),
             Text(
               'Grant temporary access to your vehicle’s AI diagnostics and maintenance records.',
               style: TextStyle(color: Colors.grey[400], fontSize: 14),
             ),
             const SizedBox(height: 32),

             // Active Connections
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Text('Active Connections', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                 Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: Colors.blue.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                  child: const Text('2 Active', style: TextStyle(color: Colors.blue, fontSize: 12)),
                )
               ],
             ),
             const SizedBox(height: 16),
             
             // Connections List (Horizontal)
             SizedBox(
               height: 180,
               child: ListView(
                 scrollDirection: Axis.horizontal,
                 children: [
                   _ConnectionCard(
                     title: "Joe's Garage",
                     role: 'Mechanic',
                     timeLeft: 'Expires in 2h 15m',
                     tags: const ['ENGINE', 'GPS'],
                     isRevokable: true,
                     imageUrl: 'https://placeholder.com/mechanic.png',
                   ),
                    _ConnectionCard(
                     title: "Sarah ...",
                     role: 'Family',
                     timeLeft: 'Forever',
                     tags: const ['ALL DATA'],
                     isRevokable: false,
                     imageUrl: 'https://placeholder.com/user.png',
                   ),
                 ],
               ),
             ),
             const SizedBox(height: 32),

             // Create New Share
             const Text('Create New Share', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
             const SizedBox(height: 16),
             const Text('Recipient', style: TextStyle(color: Colors.grey)),
             const SizedBox(height: 8),
             TextField(
               style: const TextStyle(color: Colors.white),
               decoration: InputDecoration(
                 hintText: 'Search contacts or enter email',
                 hintStyle: TextStyle(color: Colors.grey[600]),
                 prefixIcon: Icon(Icons.person_add, color: Colors.grey[600]),
                 suffixIcon: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ElevatedButton(
                     onPressed: (){}, 
                     style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[700], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                     child: const Text('Contacts')
                   ),
                 ),
                 filled: true,
                 fillColor: const Color(0xFF1E293B),
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
               ),
             ),
             const SizedBox(height: 24),
             
             // Select Data Points
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Text('Select Data Points', style: TextStyle(color: Colors.grey)),
                 TextButton(onPressed: (){}, child: const Text('Select All', style: TextStyle(color: Colors.blue))),
               ],
             ),
             GridView.count(
               crossAxisCount: 2,
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               mainAxisSpacing: 12,
               crossAxisSpacing: 12,
               childAspectRatio: 1.5,
               children: const [
                 _DataPointCard(title: 'Engine Health', subtitle: 'Diagnostics & Logs', icon: Icons.directions_car, isSelected: true),
                 _DataPointCard(title: 'Live Location', subtitle: 'Real-time GPS', icon: Icons.location_on, isSelected: false),
                 _DataPointCard(title: 'History', subtitle: 'Service Records', icon: Icons.history, isSelected: true),
                 _DataPointCard(title: 'Driving Habits', subtitle: 'Speed & Braking', icon: Icons.speed, isSelected: false),
               ],
             ),
             const SizedBox(height: 24),

             // Access Duration
             const Text('Access Duration', style: TextStyle(color: Colors.grey)),
             const SizedBox(height: 16),
             // Slider Mock
             Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: const [
                     Text('1h', style: TextStyle(color: Colors.grey, fontSize: 12)),
                     Text('24h', style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
                     Text('7d', style: TextStyle(color: Colors.grey, fontSize: 12)),
                     Text('Forever', style: TextStyle(color: Colors.grey, fontSize: 12)),
                   ],
                 ),
                 SliderTheme(
                   data: SliderTheme.of(context).copyWith(
                     activeTrackColor: Colors.blue,
                     inactiveTrackColor: Colors.grey[800],
                     thumbColor: Colors.blue,
                     overlayColor: Colors.blue.withOpacity(0.2),
                   ),
                   child: Slider(
                     value: 0.3,
                     onChanged: (_){},
                   ),
                 ),
                 const Text('Expires in 24 Hours', style: TextStyle(color: Colors.blue)),
               ],
             ),
             const SizedBox(height: 24),

             SizedBox(
               width: double.infinity,
               child: ElevatedButton.icon(
                 onPressed: (){},
                 icon: const Text('Generate Secure Link', style: TextStyle(fontWeight: FontWeight.bold)), // Workaround for icon+text order if needed, but standard is icon left
                 label: const Icon(Icons.arrow_forward), // Actually label is text, icon is icon.
                 // Correct usage:
                 // icon: Icon(Icons.arrow_forward), label: Text(...) -> Arrow on left. 
                 // UI shows text then arrow. 
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.blue,
                   padding: const EdgeInsets.symmetric(vertical: 16),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                 ),
               ),
             ),
             const SizedBox(height: 16),
             const Center(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.lock, size: 12, color: Colors.grey),
                   SizedBox(width: 4),
                   Text('End-to-end encrypted sharing', style: TextStyle(color: Colors.grey, fontSize: 12)),
                 ],
               ),
             )

          ],
        ),
      ),
    );
  }
}

class _ConnectionCard extends StatelessWidget {
  final String title;
  final String role;
  final String timeLeft;
  final List<String> tags;
  final bool isRevokable;
  final String imageUrl;

  const _ConnectionCard({
    required this.title,
    required this.role,
    required this.timeLeft,
    required this.tags,
    required this.isRevokable,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 children: [
                   CircleAvatar(radius: 16, backgroundColor: Colors.grey, child: const Icon(Icons.person)), // Mock image
                   const SizedBox(width: 12),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                       Text(role, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                     ],
                   )
                 ],
               ),
               const Icon(Icons.wifi, color: Colors.green, size: 16)
             ],
           ),
           const SizedBox(height: 12),
           Row(
             children: [
               const Icon(Icons.timer, size: 12, color: Colors.grey),
               const SizedBox(width: 4),
               Text(timeLeft, style: const TextStyle(color: Colors.grey, fontSize: 12)),
             ],
           ),
           const SizedBox(height: 12),
           Row(
             children: tags.map((t) => Container(
               margin: const EdgeInsets.only(right: 4),
               padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
               decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(4)),
               child: Text(t, style: TextStyle(color: Colors.grey[300], fontSize: 10)),
             )).toList(),
           ),
           const Spacer(),
           if (isRevokable)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: (){},
                icon: const Icon(Icons.block, size: 14, color: Colors.redAccent),
                label: const Text('Revoke Access', style: TextStyle(color: Colors.redAccent)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.redAccent),
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  visualDensity: VisualDensity.compact,
                ),
              ),
            )

        ],
      ),
    );
  }
}

class _DataPointCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;

  const _DataPointCard({required this.title, required this.subtitle, required this.icon, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: isSelected ? Border.all(color: Colors.blue) : Border.all(color: Colors.grey[800]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
              Icon(isSelected ? Icons.check_circle : Icons.circle_outlined, color: isSelected ? Colors.blue : Colors.grey[700]),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          )
        ],
      ),
    );
  }
}
