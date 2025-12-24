import 'package:flutter/material.dart';

class TripLogScreen extends StatelessWidget {
  const TripLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Dark Slate
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: (){}),
        title: const Text('Trip Log', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          TextButton(onPressed: (){}, child: const Text('Edit', style: TextStyle(color: Colors.blue))),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Vehicle Selector Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: 'Tesla Model 3 - AI01',
                  isExpanded: true,
                  dropdownColor: const Color(0xFF1E293B),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  items: ['Tesla Model 3 - AI01'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Map Card
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFF0F172A),
                image: const DecorationImage(
                  image: NetworkImage('https://placeholder.com/map_dark.png'), // Replace with asset
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    top: 12, right: 12,
                    child: Chip(
                      label: Text('GPS Active', style: TextStyle(color: Colors.white, fontSize: 10)),
                      backgroundColor: Colors.green,
                      visualDensity: VisualDensity.compact,
                      avatar: CircleAvatar(backgroundColor: Colors.white, radius: 4),
                    ),
                  ),
                   Positioned(
                    bottom: 16, left: 16, right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Vehicle Idle', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                            Text('00:00:00', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                              Text('Last trip ended 2h ago', style: TextStyle(color: Colors.grey)),
                              Text('Duration', style: TextStyle(color: Colors.grey)),
                           ],
                        ),
                         const SizedBox(height: 16),
                         Row(
                           children: [
                             const Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text('0.0', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                                 Text('DISTANCE', style: TextStyle(color: Colors.grey, fontSize: 10)),
                               ],
                             ),
                             const SizedBox(width: 48),
                             const Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text('0', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                                 Text('SPEED', style: TextStyle(color: Colors.grey, fontSize: 10)),
                               ],
                             ),
                           ],
                         ),
                         const SizedBox(height: 16),
                         SizedBox(
                           width: double.infinity,
                           child: ElevatedButton.icon(
                             onPressed: (){},
                             icon: const Icon(Icons.play_arrow),
                             label: const Text('Start Trip'),
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.blue,
                               padding: const EdgeInsets.symmetric(vertical: 12),
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                             ),
                           ),
                         )
                      ],
                    ),
                  )
                ],
              ),
            ),
             const SizedBox(height: 24),

             // Expenses Row
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Text('October Expenses', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                 TextButton(onPressed: (){}, child: const Text('View Report', style: TextStyle(color: Colors.blue))),
               ],
             ),
             SizedBox(
               height: 100,
               child: ListView(
                 scrollDirection: Axis.horizontal,
                 children: const [
                   _ExpenseCard(title: 'Total', amount: '\$251', color: Colors.blue, icon: Icons.attach_money),
                   _ExpenseCard(title: 'Fuel', amount: '\$142', color: Colors.orange, icon: Icons.local_gas_station, subtitle: '5 Transactions'),
                   _ExpenseCard(title: 'Tolls', amount: '\$24', color: Colors.purple, icon: Icons.confirmation_number, subtitle: '2 Transactions'),
                 ],
               ),
             ),
             const SizedBox(height: 24),

             // Recent Trips List
             const Text('Recent Trips', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
             const SizedBox(height: 12),
             const TextField(
               style: TextStyle(color: Colors.white),
               decoration: InputDecoration(
                 hintText: 'Search trips...',
                 hintStyle: TextStyle(color: Colors.grey),
                 prefixIcon: Icon(Icons.search, color: Colors.grey),
                 filled: true,
                 fillColor: Color(0xFF1E293B),
                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide.none),
                 contentPadding: EdgeInsets.zero,
               ),
             ),
             const SizedBox(height: 16),
             const _TripLogItem(title: 'Home -> Office', date: 'Oct 24 • 08:30 AM', distance: '12.4 km', duration: '24m', cost: '\$4.50', type: 'BUSINESS'),
             const SizedBox(height: 12),
             const _TripLogItem(title: 'Office -> Gym', date: 'Oct 23 • 05:15 PM', distance: '5.2 km', duration: '12m', cost: '', type: 'PERSONAL'),
             const SizedBox(height: 12),
             const _TripLogItem(title: 'City Center Loop', date: 'Oct 22 • 11:00 AM', distance: '3.1 km', duration: '45m', cost: '\$12.00', type: 'BUSINESS'),
             
             const SizedBox(height: 80), // Fab space
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0F172A),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, 
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Diagnostic'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Trips'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Maint.'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class _ExpenseCard extends StatelessWidget {
  final String title;
  final String amount;
  final String? subtitle;
  final Color color;
  final IconData icon;

  const _ExpenseCard({required this.title, required this.amount, this.subtitle, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 16),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Text(amount, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(subtitle!, style: const TextStyle(color: Colors.green, fontSize: 10)),
          ]
        ],
      ),
    );
  }
}

class _TripLogItem extends StatelessWidget {
  final String title;
  final String date;
  final String distance;
  final String duration;
  final String cost;
  final String type;

  const _TripLogItem({
    required this.title,
    required this.date,
    required this.distance,
    required this.duration,
    required this.cost,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Container(
             width: 60, height: 60,
             decoration: BoxDecoration(
               color: Colors.grey[800],
               borderRadius: BorderRadius.circular(8),
               // Mock map
             ),
              child: const Icon(Icons.route, color: Colors.grey),
           ),
           const SizedBox(width: 16),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                     if (cost.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(cost, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          const Text('Fuel', style: TextStyle(color: Colors.grey, fontSize: 10)),
                        ],
                      )
                   ],
                 ),
                 Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                 const SizedBox(height: 8),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(4)),
                            child: Text(distance, style: const TextStyle(color: Colors.white, fontSize: 12)),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.access_time, size: 12, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(duration, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: type == 'BUSINESS' ? Colors.blue.withOpacity(0.2) : Colors.purple.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(type, style: TextStyle(color: type == 'BUSINESS' ? Colors.blue : Colors.purple, fontSize: 10, fontWeight: FontWeight.bold)),
                      )
                   ],
                 )
               ],
             ),
           )
        ],
      ),
    );
  }
}
