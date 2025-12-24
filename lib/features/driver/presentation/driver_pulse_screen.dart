import 'package:flutter/material.dart';

class DriverPulseScreen extends StatelessWidget {
  const DriverPulseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B140E), // Dark Greenish Background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Driver Pulse', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
             // Time Period Selector
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFF1A261E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _TimeTab(label: 'Today'),
                  _TimeTab(label: 'Week', isSelected: true),
                  _TimeTab(label: 'Month'),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Score Circle
            const Stack(
              alignment: Alignment.center,
              children: [
                 SizedBox(
                   width: 200, height: 200,
                   child: CircularProgressIndicator(
                     value: 0.87,
                     strokeWidth: 16,
                     backgroundColor: Color(0xFF1A261E),
                     valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00E640)), // Bright Green
                   ),
                 ),
                 Column(
                   children: [
                     Text('87', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
                     Text('Excellent', style: TextStyle(color: Color(0xFF00E640), fontSize: 16, fontWeight: FontWeight.bold)),
                   ],
                 )
              ],
            ),
            const SizedBox(height: 16),
            const Text('Top 10% of drivers this week', style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 32),

            // AI Suggestion
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1A261E),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green.withOpacity(0.3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.auto_awesome, color: Color(0xFF00E640), size: 24),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('AI Suggestion', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 8),
                        Text(
                          'Smooth out your stops to save 5% on fuel efficiency. We noticed slightly aggressive braking on highway exits.',
                          style: TextStyle(color: Colors.grey, height: 1.4),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
             const SizedBox(height: 16),

             // Events Grid
             GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.4,
              children: const [
                _EventCard(
                  title: 'BRAKING',
                  value: '2',
                  unit: 'events',
                  statusColor: Colors.orange,
                  progress: 0.3,
                  icon: Icons.warning_amber_rounded,
                ),
                 _EventCard(
                  title: 'ACCEL',
                  value: 'Smooth',
                  unit: '',
                  statusColor: Color(0xFF00E640),
                  progress: 0.9,
                  icon: Icons.speed,
                ),
                _EventCard(
                  title: 'CORNERING',
                  value: '0.4g',
                  unit: '',
                  statusColor: Color(0xFF00E640),
                  progress: 0.8,
                  icon: Icons.turn_right,
                ),
                _EventCard(
                  title: 'SPEED',
                  value: '98%',
                  unit: '',
                  statusColor: Color(0xFF00E640),
                  progress: 0.98,
                  icon: Icons.check_circle_outline,
                ),
              ],
            ),
             const SizedBox(height: 24),
             
             // Recent Trips Header
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Text('Recent Trips', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                 TextButton(onPressed: (){}, child: const Text('View All', style: TextStyle(color: Colors.green))),
               ],
             ),
             const SizedBox(height: 12),
             
             // Recent Trip Items
             const _RecentTripItem(title: 'Grocery Run', time: '12 min', distance: '4.8 km', score: 78),
             const SizedBox(height: 12),
             const _RecentTripItem(title: 'Weekend Trip', time: '1h 45m', distance: '86 km', score: 95),

          ],
        ),
      ),
    );
  }
}

class _TimeTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  const _TimeTab({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[700]?.withOpacity(0.5) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final Color statusColor;
  final double progress;
  final IconData icon;

  const _EventCard({
    required this.title,
    required this.value,
    this.unit = '',
    required this.statusColor,
    required this.progress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A261E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: statusColor, size: 16),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                   Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                   const SizedBox(width: 4),
                   Text(unit, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(statusColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _RecentTripItem extends StatelessWidget {
  final String title;
  final String time;
  final String distance;
  final int score;

  const _RecentTripItem({required this.title, required this.time, required this.distance, required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A261E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 50, height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12),
              // Mock Map
            ),
             child: const Icon(Icons.map, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: score > 90 ? Colors.green.withOpacity(0.2) : Colors.amber.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(score.toString(), style: TextStyle(color: score > 90 ? Colors.green : Colors.amber, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 12, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    const SizedBox(width: 12),
                    const Icon(Icons.location_on, size: 12, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(distance, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
