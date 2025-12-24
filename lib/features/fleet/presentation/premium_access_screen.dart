import 'package:flutter/material.dart';

class PremiumAccessScreen extends StatelessWidget {
  const PremiumAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
        title: const Text('Premium Access', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){}, child: const Text('Restore', style: TextStyle(color: Colors.grey)))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Text(
              'Unlock Full Vehicle\nIntelligence',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Prevent breakdowns before they happen with AI diagnostics and real-time monitoring.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[400], fontSize: 16),
            ),
            const SizedBox(height: 48),

            // Toggle
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Center(child: Text('Monthly', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold))),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Yearly', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          SizedBox(width: 8),
                          // Badge
                          // Text('Save 20%', ...)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('\$99.99', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                Text(' / year', style: TextStyle(color: Colors.grey, fontSize: 16)),
              ],
            ),
            const Text('7-Day Free Trial Included', style: TextStyle(color: Colors.blue)),
            
            const SizedBox(height: 48),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('COMPARISON', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
            const SizedBox(height: 16),

            _FeatureTile(
              title: 'OBD-II Scanning',
              subtitle: 'Read basic error codes',
              icon: Icons.build,
              isPremium: false,
            ),
            const SizedBox(height: 12),
            _FeatureTile(
              title: 'AI Predictive Failure',
              subtitle: 'Forecast engine issues early',
              icon: Icons.analytics,
              isPremium: true,
              highlight: true,
            ),
            const SizedBox(height: 12),
            _FeatureTile(
              title: 'Live Sensor Data',
              subtitle: 'Real-time telemetry stream',
              icon: Icons.wifi_tethering,
              isPremium: true,
            ),
            const SizedBox(height: 12),
            _FeatureTile(
              title: 'Repair Cost Calculator',
              subtitle: 'Estimate mechanic fees',
              icon: Icons.attach_money,
              isPremium: true,
            ),

            const SizedBox(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.verified_user, size: 16, color: Colors.grey),
                SizedBox(width: 8),
                Text('SECURE PAYMENT', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
                SizedBox(width: 24),
                Icon(Icons.cancel, size: 16, color: Colors.grey),
                SizedBox(width: 8),
                Text('CANCEL ANYTIME', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Activate Premium Shield', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Terms of Service', style: TextStyle(color: Colors.grey, fontSize: 12)),
                SizedBox(width: 16),
                Text('Privacy Policy', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isPremium;
  final bool highlight;

  const _FeatureTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isPremium = false,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: highlight ? Border.all(color: Colors.blue.withOpacity(0.5)) : null,
        boxShadow: highlight ? [BoxShadow(color: Colors.blue.withOpacity(0.1), blurRadius: 10)] : null,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: highlight ? Colors.blue : Colors.grey[800], shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: Colors.blue), // Mocking check for everything for now or grey if not included
        ],
      ),
    );
  }
}
