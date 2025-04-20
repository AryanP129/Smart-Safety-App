import 'package:flutter/material.dart';


class EmergencyMediaPage extends StatefulWidget {
  const EmergencyMediaPage({super.key});

  @override
  _EmergencyMediaPageState createState() => _EmergencyMediaPageState();
}

class _EmergencyMediaPageState extends State<EmergencyMediaPage> {
  late VideoPlayerController _controller;
  bool isAudioPlaying = false;
  bool isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    // Placeholder video setup
    _controller = VideoPlayerController.asset('assets/sample_video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void toggleAudio() {
    setState(() {
      isAudioPlaying = !isAudioPlaying;
    });
  }

  void toggleVideo() {
    setState(() {
      isVideoPlaying = !isVideoPlaying;
      if (isVideoPlaying) {
        _controller.play();
      } else {
        _controller.pause();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Media'),
        backgroundColor: const Color(0xFF4A00E0),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Real-time Media from Emergency",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 30),
              // Audio Option
              GestureDetector(
                onTap: toggleAudio,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.purpleAccent.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isAudioPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                          size: 40,
                          color: Colors.deepPurple,
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'Play/Pause Audio',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Video Option
              GestureDetector(
                onTap: toggleVideo,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.deepOrangeAccent.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isVideoPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                          size: 40,
                          color: Colors.deepOrange,
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'Play/Pause Video',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Video player display
              if (isVideoPlaying) ...[
                _controller.value.isInitialized
                    ? Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: VideoPlayer(_controller),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ],
              const SizedBox(height: 30),
              // Emergency contact button
              ElevatedButton(
                onPressed: () {
                  // Here you could add logic to share the media with emergency contacts
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  "Send Media to Emergency Contacts",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
