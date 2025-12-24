import 'package:flutter/material.dart';

class VehicleLocationScreen extends StatelessWidget {
  const VehicleLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E293B), // Dark Map Placeholder
      body: Stack(
        children: [
          // Mock Map Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://placeholder.com/dark_map.png'), // Replace with actual map
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              ),
            ),
          ),
          
          // Header / Back Button
          Positioned(
            top: 40, left: 16, right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(backgroundColor: Colors.black54, child: BackButton(color: Colors.white)),
                const Text('Vehicle Location', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                CircleAvatar(backgroundColor: Colors.black54, child: IconButton(icon: const Icon(Icons.settings, color: Colors.white), onPressed: (){})),
              ],
            ),
          ),

          // Map Controls
          Positioned(
            top: 150, right: 16,
            child: Column(
              children: [
                _MapButton(icon: Icons.add),
                const SizedBox(height: 8),
                _MapButton(icon: Icons.remove),
                const SizedBox(height: 16),
                _MapButton(icon: Icons.layers),
              ],
            ),
          ),

          // Vehicle Pin (Mock)
          const Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Chip(
                  label: Text('HOME ZONE', style: TextStyle(color: Colors.white, fontSize: 10)),
                  backgroundColor: Color(0xFF1E293B),
                  side: BorderSide(color: Colors.blue),
                ),
                SizedBox(height: 8),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.directions_car, color: Colors.white),
                ),
              ],
            ),
          ),

          // Center Location Button
          Positioned(
            right: 16,
            bottom: 300, // Above the bottom sheet
            child: FloatingActionButton(
              heroTag: 'location_fab',
              backgroundColor: Colors.blue,
              mini: false,
              onPressed: (){},
              child: const Icon(Icons.my_location),
            ),
          ),

          // Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFF0F172A),
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[700], borderRadius: BorderRadius.circular(2)))),
                  const SizedBox(height: 24),
                  
                  // Tabs
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _TabItem(label: 'Status', isSelected: false),
                      _TabItem(label: 'Geofences', isSelected: true),
                      _TabItem(label: 'History', isSelected: false),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 16),

                  // Search
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search zones...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFF1E293B),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  const Text('ACTIVE ZONES', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),

                  const _ZoneTile(
                    label: 'Home',
                    location: '124 Innovation Blvd • 500m Radius',
                    icon: Icons.home,
                    isActive: true,
                  ),
                  const SizedBox(height: 12),
                  const _ZoneTile(
                    label: 'Office HQ',
                    location: '890 Tech Park Dr • 200m Radius',
                    icon: Icons.work,
                    isActive: false,
                  ),
                  const SizedBox(height: 24),
                  
                  // Create New
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: (){},
                      icon: const Icon(Icons.add_circle_outline),
                      label: const Text('Create New Zone'),
                       style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        side: const BorderSide(color: Colors.grey, style: BorderStyle.dashed),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MapButton extends StatelessWidget {
  final IconData icon;
  const _MapButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40, height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  const _TabItem({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: isSelected ? Colors.blue : Colors.grey, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        if (isSelected)
          Container(width: 40, height: 3, color: Colors.blue)
        else
          const SizedBox(height: 3),
      ],
    );
  }
}

class _ZoneTile extends StatelessWidget {
  final String label;
  final String location;
  final IconData icon;
  final bool isActive;

  const _ZoneTile({
    required this.label,
    required this.location,
    required this.icon,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: isActive ? Border.all(color: Colors.blue.withOpacity(0.3)) : null,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text(location, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Switch(
            value: isActive,
            onChanged: (val){},
            activeColor: Colors.blue,
            inactiveTrackColor: Colors.grey,
          )
        ],
      ),
    );
  }
}
