import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor:const Color.fromARGB(255, 196, 62, 196),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade100, const Color.fromARGB(255, 208, 135, 223)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildSettingsCard(
              child: SwitchListTile(
                activeColor: const Color.fromARGB(255, 232, 90, 225),
                title: Text("Enable Notifications", style: _settingTitleStyle()),
                subtitle: Text("Receive alerts and updates", style: _settingSubtitleStyle()),
                value: notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
              ),
            ),
            _buildSettingsCard(
              child: SwitchListTile(
                activeColor: const Color.fromARGB(255, 235, 112, 237),
                title: Text("Dark Mode", style: _settingTitleStyle()),
                subtitle: Text("Switch between light and dark themes", style: _settingSubtitleStyle()),
                value: darkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    darkModeEnabled = value;
                  });
                },
              ),
            ),
            _buildSettingsCard(
              child: ListTile(
                leading: Icon(Icons.lock, color: Colors.deepPurple),
                title: Text("Change Password", style: _settingTitleStyle()),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple.shade300),
                onTap: _showChangePasswordDialog,
              ),
            ),
            _buildSettingsCard(
              child: ListTile(
                leading: Icon(Icons.info, color: const Color.fromARGB(255, 238, 119, 251)),
                title: Text("About App", style: _settingTitleStyle()),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple.shade300),
                onTap: _showAboutDialog,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard({required Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }

  TextStyle _settingTitleStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple);
  }

  TextStyle _settingSubtitleStyle() {
    return TextStyle(fontSize: 14, color: Colors.black54);
  }

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text("Change Password", style: TextStyle(color: Colors.deepPurple)),
          content: Text("Feature not implemented yet.", style: TextStyle(color: Colors.black87)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK", style: TextStyle(color: Colors.deepPurple)),
            ),
          ],
        );
      },
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text("About App", style: TextStyle(color: Colors.deepPurple)),
          content: Text("Security Guard App v1.0\nDeveloped by YourCompany", style: TextStyle(color: Colors.black87)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK", style: TextStyle(color: Colors.deepPurple)),
            ),
          ],
        );
      },
    );
  }
}
