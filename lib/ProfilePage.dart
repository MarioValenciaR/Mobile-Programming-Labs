import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'DataRepository.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    DataRepository.loadData();
    _firstNameController.text = DataRepository.firstName ?? "";
    _lastNameController.text = DataRepository.lastName ?? "";
    _phoneController.text = DataRepository.phoneNumber ?? "";
    _emailController.text = DataRepository.email ?? "";
  }

  @override
  void dispose() {
    DataRepository.firstName = _firstNameController.text;
    DataRepository.lastName = _lastNameController.text;
    DataRepository.phoneNumber = _phoneController.text;
    DataRepository.email = _emailController.text;
    DataRepository.saveData();
    super.dispose();
  }

  void _callPhone() async {
    final phone = _phoneController.text;
    if (await canLaunchUrl(Uri.parse("tel:$phone"))) {
      await launchUrl(Uri.parse("tel:$phone"));
    } else {
      _showErrorDialog("Calling is not supported on this device.");
    }
  }

  void _sendSMS() async {
    final phone = _phoneController.text;
    if (await canLaunchUrl(Uri.parse("sms:$phone"))) {
      await launchUrl(Uri.parse("sms:$phone"));
    } else {
      _showErrorDialog("SMS is not supported on this device.");
    }
  }

  void _sendEmail() async {
    final Uri outlookUri = Uri.parse("https://outlook.live.com/mail/0/deeplink/compose");

    if (await canLaunchUrl(outlookUri)) {
      await launchUrl(outlookUri);
    } else {
      print("Error: Unable to open Outlook.");
    }
  }


  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
          ],
        );
      },
    );
  }
  // Function to open Outlook.com email client
  void _openOutlook() async {
    final Uri outlookUri = Uri.parse("https://outlook.live.com/mail/0/deeplink/compose");

    if (await canLaunchUrl(outlookUri)) {
      await launchUrl(outlookUri);
    } else {
      print("Error: Unable to open Outlook.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Welcome Back, $username!", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            TextField(controller: _firstNameController, decoration: const InputDecoration(labelText: "First Name", border: OutlineInputBorder())),
            const SizedBox(height: 10),

            TextField(controller: _lastNameController, decoration: const InputDecoration(labelText: "Last Name", border: OutlineInputBorder())),
            const SizedBox(height: 10),

            Row(
              children: [
                Flexible(child: TextField(controller: _phoneController, decoration: const InputDecoration(labelText: "Phone Number", border: OutlineInputBorder()))),
                IconButton(onPressed: _callPhone, icon: const Icon(Icons.call)),
                IconButton(onPressed: _sendSMS, icon: const Icon(Icons.message)),
              ],
            ),
            const SizedBox(height: 10),

// Email TextField with "Mail" button
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email address",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(
              onPressed: _sendEmail, //
              icon: const Icon(Icons.email),
              tooltip: "Send Email",
            ),
          ],
        ),
            ElevatedButton(
              onPressed: () {
                // Save input data into DataRepository
                DataRepository.firstName = _firstNameController.text;
                DataRepository.lastName = _lastNameController.text;
                DataRepository.phoneNumber = _phoneController.text;
                DataRepository.email = _emailController.text;

                // Call saveData() to store in EncryptedSharedPreferences
                DataRepository.saveData();

                // Show confirmation message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profile information saved successfully!")),
                );
              },
              child: const Text("Save"),
            ),

          ]

        ),

      ),
    );
  }
}
