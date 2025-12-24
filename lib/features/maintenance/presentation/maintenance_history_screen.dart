import 'package:flutter/material.dart';

class MaintenanceHistoryScreen extends StatelessWidget {
  const MaintenanceHistoryScreen({super.key});

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
        title: const Text('Maintenance History', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Vehicle Header
          _VehicleHeader(),
          
          // Search & Filter
          _SearchAndFilter(),

          // Timeline
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                _MonthHeader(month: 'OCTOBER 2023'),
                _TimelineItem(
                  day: '24',
                  weekday: 'TUE',
                  isCritical: true,
                  isAiPredicted: true,
                  title: 'Brake Service',
                  description: 'AI detected 15% pad life remaining.\nScheduled preemptively.',
                  cost: '\$450.00',
                  items: ['Front Brake Pads (Ceramic)', 'Brake Rotors Resurfacing'],
                ),
                _TimelineItem(
                  day: '02',
                  weekday: 'MON',
                  isCritical: false,
                  title: 'Tire Rotation & Balance',
                  cost: '\$45.00',
                  provider: 'Discount Tire Center',
                ),
                SizedBox(height: 24),
                _MonthHeader(month: 'AUGUST 2023'),
                _TimelineItem(
                  day: '12',
                  weekday: 'SAT',
                  isCritical: false,
                  isCompleted: true,
                  title: '10k Mile Service',
                  description: 'Standard scheduled maintenance interval.',
                  cost: '\$120.00',
                  items: ['Oil Filter', 'Cabin Filter...'],
                ),
                 Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text('End of maintenance history', style: TextStyle(color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VehicleHeader extends StatelessWidget {
  const _VehicleHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage('https://placeholder.com/car.png'), // Replace with asset
                fit: BoxFit.cover,
              ),
            ),
             child: const Center(child: Icon(Icons.directions_car, color: Colors.white)),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('2021 Tesla Model 3', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              Text('VIN: ...8X92 • 34,502 mi', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              const SizedBox(height: 4),
              const Row(
                children: [
                   Text('YTD SPEND ', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
                   Text('\$1,240.00', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _SearchAndFilter extends StatelessWidget {
  const _SearchAndFilter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search logs (e.g., "Brakes", "Oct 2023")...',
              hintStyle: TextStyle(color: Colors.grey[600]),
              prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
              filled: true,
              fillColor: const Color(0xFF1E1E1E),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _FilterChip(label: 'ALL', isSelected: true),
              _FilterChip(label: 'REPAIRS'),
              _FilterChip(label: 'ROUTINE'),
              _FilterChip(label: 'AI PREDICTED', isAi: true),
            ],
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isAi;

  const _FilterChip({required this.label, this.isSelected = false, this.isAi = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Row(
          children: [
            if (isAi) const Padding(padding: EdgeInsets.only(right: 4), child: Icon(Icons.auto_awesome, size: 14, color: Colors.purpleAccent)),
            Text(label, style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey, 
              fontWeight: FontWeight.bold,
              fontSize: 12,
            )),
          ],
        ),
        selected: isSelected,
        onSelected: (bool selected) {},
        backgroundColor: const Color(0xFF1E1E1E),
        selectedColor: Colors.blue[700],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: isSelected ? Colors.blue : Colors.transparent)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        checkmarkColor: Colors.white,
      ),
    );
  }
}

class _MonthHeader extends StatelessWidget {
  final String month;
  const _MonthHeader({required this.month});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(month, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String day;
  final String weekday;
  final bool isCritical;
  final bool isAiPredicted;
  final bool isCompleted;
  final String title;
  final String? description;
  final String cost;
  final List<String>? items;
  final String? provider;

  const _TimelineItem({
    required this.day,
    required this.weekday,
    this.isCritical = false,
    this.isAiPredicted = false,
    this.isCompleted = false,
    required this.title,
    this.description,
    required this.cost,
    this.items,
    this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date Column
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Text(day, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                Text(weekday, style: const TextStyle(color: Colors.grey, fontSize: 10)),
                const SizedBox(height: 8),
                Container(
                  width: 12, height: 12,
                  decoration: BoxDecoration(
                    color: isCritical || isAiPredicted ? Colors.blue : (isCompleted ? Colors.green : Colors.grey),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF121212), width: 2),
                  ),
                ),
                Expanded(child: Container(width: 2, color: Colors.grey[800])),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Content Card
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(16),
                border: isCritical ? Border.all(color: Colors.blue.withOpacity(0.3)) : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isCritical)
                         Container(
                           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                           decoration: BoxDecoration(color: Colors.blue[900], borderRadius: BorderRadius.circular(4)),
                           child: const Text('CRITICAL', style: TextStyle(color: Colors.blue, fontSize: 10, fontWeight: FontWeight.bold)),
                         ),
                      if (isAiPredicted)
                        Row(
                          children: [
                            if(isCritical) const SizedBox(width: 8),
                            const Icon(Icons.auto_awesome, size: 14, color: Colors.purpleAccent),
                            const SizedBox(width: 4),
                            const Text('AI PREDICTED', style: TextStyle(color: Colors.purpleAccent, fontSize: 10, fontWeight: FontWeight.bold)),
                          ],
                        ),
                       if (!isCritical && !isAiPredicted && isCompleted)
                          Container(
                           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                           decoration: BoxDecoration(color: Colors.green[900], borderRadius: BorderRadius.circular(4)),
                           child: const Text('COMPLETED', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                         ),
                       if (!isCritical && !isAiPredicted && !isCompleted)
                          Container(
                           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                           decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(4)),
                           child: const Text('ROUTINE', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
                         ),
                      Text(cost, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  if (description != null) ...[
                    const SizedBox(height: 4),
                    Text(description!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                  const SizedBox(height: 12),
                  if (items != null)
                     Container(
                       padding: const EdgeInsets.all(12),
                       decoration: BoxDecoration(
                         color: Colors.black26,
                         borderRadius: BorderRadius.circular(8),
                       ),
                       child: Column(
                         children: items!.map((item) => Padding(
                           padding: const EdgeInsets.only(bottom: 4),
                           child: Row(
                             children: [
                               const Icon(Icons.check_circle, size: 14, color: Colors.grey),
                               const SizedBox(width: 8),
                               Expanded(child: Text(item, style: const TextStyle(color: Colors.grey, fontSize: 12))),
                             ],
                           ),
                         )).toList(),
                       ),
                     ),
                  if (provider != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.build, size: 14, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text(provider!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
