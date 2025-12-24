import 'package:flutter/material.dart';

class SecurityControlScreen extends StatelessWidget {
  const SecurityControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: const Text('Security Control', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
             // Car Image (Top View)
             SizedBox(
               height: 200,
               child: Stack(
                 alignment: Alignment.bottomRight,
                 children: [
                   Center(
                     child: Image.network(
                       'https://placeholder.com/car_top_view.png', // Replace
                       height: 180,
                       fit: BoxFit.contain,
                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.only(right: 16, bottom: 32),
                     child: CircleAvatar(
                       backgroundColor: Color(0xFF1E293B),
                       child: Icon(Icons.lock, color: Colors.blue),
                     ),
                   )
                 ],
               ),
             ),
             
             // Status Indicator
             const Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.circle, size: 8, color: Colors.blue),
                 SizedBox(width: 8),
                 Text('Status: Secure', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
               ],
             ),
             const SizedBox(height: 8),
             const Text('Alarm Armed • Last sync: 12:42 PM', style: TextStyle(color: Colors.grey)),
             const SizedBox(height: 24),

             // Grid Controls
             GridView.count(
               crossAxisCount: 2,
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               mainAxisSpacing: 12,
               crossAxisSpacing: 12,
               childAspectRatio: 1.4,
               children: const [
                 _ControlCard(
                   title: 'Vehicle Locked',
                   subtitle: 'Tap to unlock',
                   icon: Icons.lock,
                   isActive: true,
                   activeColor: Colors.blue,
                 ),
                 _ControlCard(
                   title: 'Alarm System',
                   subtitle: 'Armed & Ready',
                   icon: Icons.notifications_active,
                   isActive: true,
                   activeColor: Colors.green, // Visual diff in mockup
                 ),
                 _ControlCard(
                   title: 'Sentry Mode',
                   subtitle: 'Mode',
                   icon: Icons.missed_video_call, // Closest to eye?
                   isActive: false,
                   activeColor: Colors.red,
                   // This one is off in mockup? Or active red dot?
                   // Mockup shows "Sentry Mode" with red dot.
                   showRedDot: true,
                 ),
                 _ControlCard(
                   title: 'Valet Mode',
                   subtitle: 'Valet Mode',
                   icon: Icons.local_parking, // P icon
                   isActive: false,
                   activeColor: Colors.grey,
                 ),
                 _ControlCard(
                   title: 'Windows',
                   subtitle: 'Windows',
                   icon: Icons.window, // Closest
                   isActive: false,
                   activeColor: Colors.grey,
                   isSimple: true,
                 ),
                  _ControlCard(
                   title: 'Trunk',
                   subtitle: 'Trunk',
                   icon: Icons.garage, // Closest
                   isActive: false,
                   activeColor: Colors.grey,
                   isSimple: true,
                 ),
               ],
             ),
             const SizedBox(height: 24),

             // Location & Emergency
             const Align(
               alignment: Alignment.centerLeft,
               child: Text('Location & Emergency', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
             ),
             const SizedBox(height: 12),
             
             // Map Card
             Container(
               height: 100,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16),
                 image: const DecorationImage(
                   image: NetworkImage('https://placeholder.com/map_small.png'),
                   fit: BoxFit.cover,
                 ),
               ),
               child: Stack(
                 children: [
                   Container(
                     decoration: BoxDecoration(
                       gradient: LinearGradient(
                         begin: Alignment.centerLeft,
                         end: Alignment.centerRight,
                         colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                       ),
                       borderRadius: BorderRadius.circular(16),
                     ),
                   ),
                   const Positioned(
                     left: 16, top: 16, bottom: 16,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                          Row(
                            children: [
                              Icon(Icons.navigation, color: Colors.blue, size: 16),
                              SizedBox(width: 4),
                              Text('PARKED', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text('1248 Market St, San Franci...', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                       ],
                     ),
                   ),
                   Positioned(
                     right: 16, top: 0, bottom: 0,
                     child: Center(
                       child: CircleAvatar(
                         backgroundColor: Colors.grey[800],
                         child: const Icon(Icons.chevron_right, color: Colors.white),
                       ),
                     ),
                   )
                 ],
               ),
             ),
             const SizedBox(height: 16),

             // SOS Button
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: (){}, 
                 style: ElevatedButton.styleFrom(
                   backgroundColor: const Color(0xFF2D1A1E), // Dark Red/Brown
                   foregroundColor: Colors.redAccent,
                   side: BorderSide(color: Colors.redAccent.withOpacity(0.5)),
                   padding: const EdgeInsets.symmetric(vertical: 20),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                 ),
                 child: const Text('SOS  Emergency Assistance', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
               ),
             ),
             const SizedBox(height: 24),

          ],
        ),
      ),
    );
  }
}

class _ControlCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isActive;
  final Color activeColor;
  final bool showRedDot;
  final bool isSimple;

  const _ControlCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isActive = false,
    this.activeColor = Colors.blue,
    this.showRedDot = false,
    this.isSimple = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: isActive ? Border.all(color: activeColor.withOpacity(0.5)) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isActive ? activeColor.withOpacity(0.2) : Colors.grey[800], 
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: isActive ? activeColor : Colors.white),
              ),
              if (isActive && !isSimple)
                 Icon(Icons.circle, size: 8, color: activeColor),
              if (showRedDot)
                 const Icon(Icons.circle, size: 8, color: Colors.red),
            ],
          ),
          if (isSimple) ...[
             const SizedBox(height: 8),
             Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ] else ...[
             const SizedBox(height: 8),
             Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
             Text(subtitle, style: TextStyle(color: isActive ? activeColor : Colors.grey, fontSize: 12)),
          ]
        ],
      ),
    );
  }
}
