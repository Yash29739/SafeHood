import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ResidentStatusPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ResidentStatusPage extends StatelessWidget {
  const ResidentStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resident Status', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [IconButton(icon: Icon(Icons.notifications), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCurrentStatus(),
            SizedBox(height: 16),
            _buildResidentActivity(),
            SizedBox(height: 16),
            _buildRecentActivityLog(),
            Spacer(),
            _buildGenerateReportButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStatus() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _statusColumn('12', 'Residents In', Colors.purple),
            _statusColumn('4', 'Residents Out', Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _statusColumn(String count, String label, Color color) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.black54)),
      ],
    );
  }

  Widget _buildResidentActivity() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Resident Activity', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: Text('Update Status'),
              ),
            ),
            _residentTile('Sarah Johnson', 'Apt 301', Colors.green, 'IN'),
            _residentTile('Michael Chen', 'Apt 405', Colors.red, 'OUT'),
            _residentTile('Emily Rodriguez', 'Apt 202', Colors.green, 'IN'),
          ],
        ),
      ),
    );
  }

  Widget _residentTile(String name, String apt, Color statusColor, String status) {
    return Card(
      color: statusColor.withOpacity(0.2),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.white),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(apt),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(status, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildRecentActivityLog() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent Activity Log', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _logEntry(Icons.login, 'Emily Rodriguez checked in', '2 min ago', Colors.green),
            _logEntry(Icons.logout, 'Michael Chen checked out', '15 min ago', Colors.red),
            _logEntry(Icons.login, 'Sarah Johnson checked in', '1 hour ago', Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _logEntry(IconData icon, String text, String time, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text),
      trailing: Text(time, style: TextStyle(color: Colors.black54)),
    );
  }

  Widget _buildGenerateReportButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Center(
        child: Text('Generate Activity Report', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
