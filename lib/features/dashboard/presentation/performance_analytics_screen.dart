import 'package:flutter/material.dart';

class PerformanceAnalyticsScreen extends StatelessWidget {
  const PerformanceAnalyticsScreen({super.key});

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
        title: const Text('Performance Analytics', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Vehicle Selector
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _VehicleChip(label: 'Tesla Model 3', isSelected: true, icon: Icons.electric_car),
                  const SizedBox(width: 8),
                  _VehicleChip(label: 'Toyota Camry', icon: Icons.directions_car),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Time Selector
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _TimeTab(label: '24H'),
                  _TimeTab(label: '7D', isSelected: true),
                  _TimeTab(label: '30D'),
                  _TimeTab(label: '1Y'),
                  _TimeTab(label: 'ALL'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Engine Health Score Graph
            const _HealthScoreGraph(),
            const SizedBox(height: 24),

            // AI Diagnostic Alert
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.blue.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.auto_awesome, color: Colors.blue, size: 20),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('AI Diagnostic Alert', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          Text('PREDICTIVE MAINTENANCE', style: TextStyle(color: Colors.grey, fontSize: 10)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Based on recent braking patterns, brake pad wear has accelerated by 4%. Schedule inspection soon.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.withOpacity(0.1),
                        foregroundColor: Colors.blue,
                        elevation: 0,
                      ),
                      child: const Text('View Technical Details'),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Metrics Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.4,
              children: const [
                _MetricCard(
                  title: 'MPG Avg',
                  value: '28.5',
                  change: '-2.4%',
                  changeColor: Colors.red,
                  icon: Icons.local_gas_station,
                ),
                _MetricCard(
                  title: 'Est. Range (mi)',
                  value: '240',
                  change: '+5mi',
                  changeColor: Colors.green,
                  icon: Icons.battery_charging_full,
                ),
                _MetricCard(
                  title: 'PSI (Front Left)',
                  value: '34',
                  change: 'Stable',
                  changeColor: Colors.grey,
                  icon: Icons.history_toggle_off,
                ),
                _MetricCard(
                  title: 'Oil Life Remaining',
                  value: '15%',
                  change: 'Attention',
                  changeColor: Colors.orange,
                  icon: Icons.water_drop,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, // Analytics
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.car_repair), label: 'Service'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class _VehicleChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final IconData icon;

  const _VehicleChip({required this.label, this.isSelected = false, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[800] : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontWeight: FontWeight.bold)),
    );
  }
}

class _HealthScoreGraph extends StatelessWidget {
  const _HealthScoreGraph();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Engine Health Score', style: TextStyle(color: Colors.grey, fontSize: 12)),
            
          ],
        ),
        const SizedBox(height: 4),
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             const Text('92%', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
             Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
              child: const Row(
                children: [
                  Icon(Icons.trending_up, color: Colors.green, size: 14),
                  SizedBox(width: 4),
                  Text('+1.2%', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ),
           ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[800]!)),
          ),
          child: const Placeholder(color: Colors.blue, strokeWidth: 2), // Placeholder for actual graph
        ),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('MON', style: TextStyle(color: Colors.grey, fontSize: 10)),
            Text('TUE', style: TextStyle(color: Colors.grey, fontSize: 10)),
            Text('WED', style: TextStyle(color: Colors.grey, fontSize: 10)),
            Text('THU', style: TextStyle(color: Colors.grey, fontSize: 10)),
            Text('FRI', style: TextStyle(color: Colors.grey, fontSize: 10)),
            Text('SAT', style: TextStyle(color: Colors.grey, fontSize: 10)),
            Text('SUN', style: TextStyle(color: Colors.grey, fontSize: 10)),
          ],
        )
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final Color changeColor;
  final IconData icon;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.change,
    required this.changeColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: Colors.grey, size: 16),
              Text(change, style: TextStyle(color: changeColor, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              Text(title, style: const TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          )
        ],
      ),
    );
  }
}
