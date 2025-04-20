import 'package:flutter/material.dart';

class SetTriggerWordsScreen extends StatefulWidget {
  const SetTriggerWordsScreen({Key? key}) : super(key: key);

  @override
  State<SetTriggerWordsScreen> createState() => _SetTriggerWordsScreenState();
}

class _SetTriggerWordsScreenState extends State<SetTriggerWordsScreen> {
  final List<String> _activationWords = [];
  final List<String> _cancellationWords = [];
  final TextEditingController _activationController = TextEditingController();
  final TextEditingController _cancellationController = TextEditingController();

  void _addWord(List<String> wordList, TextEditingController controller) {
    final text = controller.text.trim();
    if (text.isNotEmpty && !wordList.contains(text)) {
      setState(() {
        wordList.add(text);
        controller.clear();
      });
    }
  }

  void _removeWord(List<String> wordList, String word) {
    setState(() {
      wordList.remove(word);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Set Trigger Words'),
        backgroundColor: Colors.redAccent.shade200,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildExpandableSection(
              title: 'Activation Trigger Words',
              controller: _activationController,
              wordList: _activationWords,
              onAdd: () => _addWord(_activationWords, _activationController),
              onDelete: (word) => _removeWord(_activationWords, word),
              initiallyExpanded: true,
            ),
            const SizedBox(height: 20),
            _buildExpandableSection(
              title: 'Cancellation Trigger Words',
              controller: _cancellationController,
              wordList: _cancellationWords,
              onAdd: () => _addWord(_cancellationWords, _cancellationController),
              onDelete: (word) => _removeWord(_cancellationWords, word),
              initiallyExpanded: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required TextEditingController controller,
    required List<String> wordList,
    required VoidCallback onAdd,
    required Function(String) onDelete,
    bool initiallyExpanded = false,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        collapsedIconColor: Colors.white70,
        iconColor: Colors.redAccent,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Enter trigger word',
                      hintStyle: TextStyle(color: Colors.white38),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.redAccent, size: 30),
                  onPressed: onAdd,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          if (wordList.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'No words added yet.',
                style: TextStyle(color: Colors.white54),
              ),
            ),
          if (wordList.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: wordList.length,
              itemBuilder: (context, index) {
                final word = wordList[index];
                return Card(
                  color: Colors.grey[850],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ListTile(
                    title: Text(
                      word,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                      onPressed: () => onDelete(word),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
