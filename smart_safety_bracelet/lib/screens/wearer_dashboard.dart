import 'package:flutter/material.dart';
import 'set_trigger_words_screen.dart';
import 'emergency_contacts_screen.dart';
import 'mind_map_preview_screen.dart';

class WearerDashboard extends StatelessWidget {
  const WearerDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Wearer Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF232526), Color(0xFF414345)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.redAccent,
                      elevation: 10,
                    ),
                    onPressed: () {},
                    child: const Icon(Icons.warning, size: 50, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),
                _buildCard(
                  icon: Icons.record_voice_over,
                  title: 'Set Trigger Words',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SetTriggerWordsScreen()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildCard(
                  icon: Icons.contacts,
                  title: 'Emergency Contacts',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmergencyContactsScreen()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildStatusTile('Location Sharing', 'Enabled', Icons.location_on),
                const SizedBox(height: 16),
                _buildStatusTile('Bracelet Battery', '87%', Icons.battery_full),
                const SizedBox(height: 16),
                _buildStatusTile('Heart Rate', '78 bpm', Icons.favorite),
                const SizedBox(height: 30),

                // MINI MAP PREVIEW SECTION - now clickable
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MindMapPreviewScreen()),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 150,
                      color: Colors.grey.shade800,
                      child: const Center(
                        child: Text(
                          'Mini Map Preview',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Mind Map View Button
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MindMapPreviewScreen()),
                    );
                  },
                  icon: const Icon(Icons.map, color: Colors.white),
                  label: const Text('View Mind Map',
                      style: TextStyle(color: Colors.white)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white24),
        ),
        child: Row(
          children: [
            Icon(icon, size: 32, color: Colors.white),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTile(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Colors.white70),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
