import 'package:flutter/material.dart';

class WearerList extends StatelessWidget {
  const WearerList({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - Replace with dynamic data from Firebase or backend
    final List<Map<String, String>> wearers = [
      {
        'name': 'Anjali Sharma',
        'status': 'Safe',
        'lastSeen': '10 mins ago',
      },
      {
        'name': 'Riya Verma',
        'status': 'In Danger',
        'lastSeen': '2 mins ago',
      },
      {
        'name': 'Sneha Patel',
        'status': 'Safe',
        'lastSeen': '30 mins ago',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Linked Wearers'),
        backgroundColor: const Color(0xFF4A00E0),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: wearers.length,
          itemBuilder: (context, index) {
            final wearer = wearers[index];
            final isSafe = wearer['status'] == 'Safe';

            return Card(
              color: Colors.white.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: isSafe ? Colors.greenAccent : Colors.redAccent,
                  child: Icon(
                    isSafe ? Icons.check_circle : Icons.warning,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  wearer['name']!,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "Status: ${wearer['status']} \nLast seen: ${wearer['lastSeen']}",
                  style: const TextStyle(color: Colors.white70),
                ),
                isThreeLine: true,
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
                onTap: () {
                  // Navigate to a detailed profile or location
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
