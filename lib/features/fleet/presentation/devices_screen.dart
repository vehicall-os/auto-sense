import 'package:flutter/material.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text('Devices', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0F172A),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: (){}),
          IconButton(icon: const Icon(Icons.add), onPressed: (){}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Pair New Device Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                    child: const Icon(Icons.bluetooth, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pair New Device', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('Supports Bluetooth 5.0 & Wi-Fi OBD', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // My Hardware Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('My Hardware', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: Colors.blue.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                  child: const Text('2 Active', style: TextStyle(color: Colors.blue, fontSize: 12)),
                )
              ],
            ),
            const SizedBox(height: 16),

            // Devices List
            const _DeviceCard(
              name: 'OBD-II Dongle Pro',
              id: 'OBD-99X-21',
              imageUrl: 'https://placeholder.com/obd.png', // Replace
              isConnected: true,
              extraInfo: 'Signal: Strong',
            ),
            const SizedBox(height: 16),
             const _DeviceCard(
              name: 'TPMS Sensor Left-Front',
              id: 'TPM-LF-04',
              imageUrl: 'https://placeholder.com/tpms.png', // Replace
              isConnected: false,
              extraInfo: 'Last seen: 2m ago',
              actionLabel: 'Reconnect',
              isError: true,
            ),
            const SizedBox(height: 24),

            // Connectivity Help
            const Align(alignment: Alignment.centerLeft, child: Text('Connectivity Help', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
            const SizedBox(height: 12),
            const _HelpTile(label: 'Device not showing up?'),
            const SizedBox(height: 8),
            const _HelpTile(label: 'How to reset OBD dongle', icon: Icons.build),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0F172A),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, 
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Devices'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analysis'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class _DeviceCard extends StatelessWidget {
  final String name;
  final String id;
  final String imageUrl;
  final bool isConnected;
  final String extraInfo;
  final String? actionLabel;
  final bool isError;

  const _DeviceCard({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.isConnected,
    required this.extraInfo,
    this.actionLabel,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Header Image
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(width: 8),
                    Container(
                      width: 8, height: 8,
                      decoration: BoxDecoration(color: isConnected ? Colors.green : Colors.grey, shape: BoxShape.circle),
                    )
                  ],
                ),
                Text('ID: $id', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: isConnected ? Colors.green : Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(isConnected ? 'CONNECTED' : 'DISCONNECTED', style: TextStyle(color: isConnected ? Colors.green : Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 12),
                    Text(extraInfo, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: (){}, 
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.grey),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(actionLabel ?? 'Manage'),
                      ),
                    ),
                    if (actionLabel != null) // If action label exists, maybe show delete icon
                       Padding(
                         padding: const EdgeInsets.only(left: 8),
                         child: IconButton(onPressed: (){}, icon: const Icon(Icons.delete, color: Colors.grey)),
                       )
                    else 
                       Padding(
                         padding: const EdgeInsets.only(left: 8),
                         child: IconButton(onPressed: (){}, icon: const Icon(Icons.settings, color: Colors.grey)),
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

class _HelpTile extends StatelessWidget {
  final String label;
  final IconData? icon;

  const _HelpTile({required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null) ...[Icon(icon, color: Colors.blue, size: 20), const SizedBox(width: 12)],
              if (icon == null) ...[Container(padding: const EdgeInsets.all(2), decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle), child: const Icon(Icons.question_mark, size: 12, color: Colors.white)), const SizedBox(width: 12)],
              Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ],
      ),
    );
  }
}
