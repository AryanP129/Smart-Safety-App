import 'package:flutter/material.dart';

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({Key? key}) : super(key: key);

  @override
  _EmergencyContactsScreenState createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  // Sample emergency contacts list (stored in memory)
  List<Map<String, String>> _emergencyContacts = [
    {'name': 'John Doe', 'phone': '123-456-7890'},
    {'name': 'Jane Smith', 'phone': '987-654-3210'},
  ];

  // Controllers for adding new contacts
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  // Function to show confirmation dialog for deletion
  Future<void> _showDeleteConfirmationDialog(int index) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this contact?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _emergencyContacts.removeAt(index); // Delete the contact
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Function to show the Add Contact dialog
  Future<void> _showAddContactDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Enter Name'),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(hintText: 'Enter Phone Number'),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String name = _nameController.text.trim();
                String phone = _phoneController.text.trim();
                if (name.isNotEmpty && phone.isNotEmpty) {
                  setState(() {
                    // Add new contact to the list
                    _emergencyContacts.add({'name': name, 'phone': phone});
                    _nameController.clear();
                    _phoneController.clear();
                  });
                  Navigator.of(context).pop(); // Close the dialog
                } else {
                  // Show error message if name or phone is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter both name and phone')),
                  );
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Function to build the emergency contact list
  Widget _buildEmergencyContactList() {
    return ListView.builder(
      itemCount: _emergencyContacts.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text(
              _emergencyContacts[index]['name']!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              _emergencyContacts[index]['phone']!,
              style: TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _showDeleteConfirmationDialog(index); // Show confirmation dialog
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddContactDialog, // Show Add Contact dialog
          ),
        ],
      ),
      body: _buildEmergencyContactList(), // Display contacts
    );
  }
}
