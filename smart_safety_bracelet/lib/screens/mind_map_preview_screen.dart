import 'package:flutter/material.dart';

class MindMapPreviewScreen extends StatelessWidget {
  const MindMapPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mind Map Preview"),
        backgroundColor: const Color(0xFF232526),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF2C2F33),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Live Location Map",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),

            // Simulated Map Preview Box
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/images/map_preview.jpg'), // Replace with your map image or use Google Map widget later
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.circle, color: Colors.green, size: 12),
                          SizedBox(width: 5),
                          Text(
                            "Active",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.redAccent,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Details / Legend
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white24),
              ),
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.circle, color: Colors.greenAccent),
                    title: Text(
                      "You",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Divider(color: Colors.white24),
                  ListTile(
                    leading: Icon(Icons.circle, color: Colors.blueAccent),
                    title: Text(
                      "Trusted Contact",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Divider(color: Colors.white24),
                  ListTile(
                    leading: Icon(Icons.circle, color: Colors.redAccent),
                    title: Text(
                      "Last Known Location",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
