import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VehicleDashboardScreen extends ConsumerWidget {
  const VehicleDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock Data
    final healthScore = 92;
    final vehicleName = 'Tesla Model 3';
    
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
            const Text(
              "Alex's Dashboard",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vehicle Health Card
            _VehicleHealthCard(name: vehicleName, score: healthScore),
            const SizedBox(height: 24),

            // AI Predictions
            _SectionHeader(title: 'AI Predictions', action: 'View All'),
            const SizedBox(height: 12),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _PredictionCard(
                    title: 'Oil Change',
                    subtitle: 'Viscosity dropping slightly.',
                    timeLeft: '~3 Weeks',
                    progress: 0.7,
                    icon: Icons.oil_barrel,
                    color: Colors.blue,
                  ),
                   _PredictionCard(
                    title: 'Tire Rotation',
                    subtitle: 'Rear treads wearing faster.',
                    timeLeft: '~500 Miles',
                    progress: 0.4,
                    icon: Icons.tire_repair,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Live Diagnostics
            const _SectionHeader(title: 'Live Diagnostics'),
            const SizedBox(height: 12),
            const _LiveDiagnosticsGrid(),
            
            const SizedBox(height: 24),

            // Active Alerts
            const _SectionHeader(title: 'Active Alerts (DTC)'),
            const SizedBox(height: 12),
            const _ActiveAlertCard(
              code: 'P0171: System Too Lean',
              description: 'Bank 1 system is running too lean. Check O2 sensor.',
              severity: 'HIGH',
              color: Colors.red,
            ),
            const SizedBox(height: 8),
             const _ActiveAlertCard(
              code: 'P0442: EVAP Leak',
              description: 'Small leak detected in evaporative emission system.',
              severity: 'LOW',
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? action;

  const _SectionHeader({required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        if (action != null)
          TextButton(
            onPressed: () {},
            child: Text(action!, style: const TextStyle(color: Colors.blue)),
          ),
      ],
    );
  }
}

class _VehicleHealthCard extends StatelessWidget {
  final String name;
  final int score;

  const _VehicleHealthCard({required this.name, required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                   Container(
                    width: 50, height: 50,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.directions_car, color: Colors.black), // Placeholder for car image
                   ),
                   const SizedBox(width: 12),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                       const Row(
                         children: [
                           Icon(Icons.circle, color: Colors.green, size: 8),
                           SizedBox(width: 4),
                           Text('CONNECTED', style: TextStyle(color: Colors.grey, fontSize: 10)),
                         ],
                       )
                     ],
                   )
                ],
              ),
              const Column(
                children: [
                  Icon(Icons.battery_charging_full, color: Colors.grey),
                  Text('56%', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: score / 100,
                  strokeWidth: 12,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
              Column(
                children: [
                  const Text('HEALTH SCORE', style: TextStyle(color: Colors.grey, fontSize: 10)),
                  Text('$score%', style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text('Optimal Condition', style: TextStyle(color: Colors.green, fontSize: 10)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _PredictionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timeLeft;
  final double progress;
  final IconData icon;
  final Color color;

  const _PredictionCard({
    required this.title,
    required this.subtitle,
    required this.timeLeft,
    required this.progress,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
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
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              Text(timeLeft, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 10), maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ],
      ),
    );
  }
}

class _LiveDiagnosticsGrid extends StatelessWidget {
  const _LiveDiagnosticsGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: const [
        _DiagnosticCard(title: 'Speed', value: '12.6 V', isGraph: true), // Placeholder value
        _DiagnosticCard(title: 'Battery', value: '85 %', isGraph: true), // Placeholder
        _DiagnosticCard(title: 'PRESSURE', value: '34 PSI', isGraph: false),
        _DiagnosticCard(title: 'ENGINE', value: '195 °F', isGraph: false),
      ],
    );
  }
}

class _DiagnosticCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isGraph;

  const _DiagnosticCard({required this.title, required this.value, required this.isGraph});

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
        children: [
          Row(
            children: [
              Icon(isGraph ? Icons.auto_graph : Icons.speed, color: Colors.grey, size: 16),
              const SizedBox(width: 4),
              Text(title, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
          const Spacer(),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          if (isGraph)
             const SizedBox(
               height: 20,
               child: Placeholder(color: Colors.blue, strokeWidth: 1), // Placeholder for sparkline
             ),
          if (!isGraph)
            Container(height: 4, width: 40, color: Colors.grey),
        ],
      ),
    );
  }
}

class _ActiveAlertCard extends StatelessWidget {
  final String code;
  final String description;
  final String severity;
  final Color color;

  const _ActiveAlertCard({
    required this.code,
    required this.description,
    required this.severity,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: color.withOpacity(0.2), shape: BoxShape.circle),
            child: Icon(Icons.warning, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(code, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
                      child: Text(severity, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
