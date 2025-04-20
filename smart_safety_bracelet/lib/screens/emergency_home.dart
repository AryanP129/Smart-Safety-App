import 'package:flutter/material.dart';

class EmergencyHome extends StatelessWidget {
  const EmergencyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Emergency Dashboard",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Stay updated with real-time alerts and the safety status of your loved ones.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),

              // Recent Alert Card
              Card(
                color: Colors.white.withOpacity(0.15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: const Icon(Icons.warning_amber_rounded, color: Colors.redAccent, size: 32),
                  title: const Text("Recent SOS Alert",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  subtitle: const Text("Received from: Anjali Sharma\n5 minutes ago",
                      style: TextStyle(color: Colors.white70)),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
                  onTap: () {
                    // Navigate to detail alert page or media
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Quick Access Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _quickActionTile(context, Icons.location_on, "Live Location"),
                  _quickActionTile(context, Icons.perm_media, "Media"),
                  _quickActionTile(context, Icons.people, "Wearers"),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Safety Tip:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Always keep your phone’s GPS on and volume up to receive alerts promptly. Confirm emergency alerts quickly to avoid false responses.",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quickActionTile(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        // Add navigation to the respective screen
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white.withOpacity(0.2),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
