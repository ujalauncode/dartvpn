import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ServerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1226),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E2466),
        title: Text('VPN Server Locations',
        style: TextStyle(color: Colors.white),
        ),
        
        
      ),
      body: ListView.builder(
        itemCount: 10, 
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/flags/flag_$index.png'), 
            ),
            title: Text(
              'Country $index',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              '130.0 Mbps',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '30',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 8.w),
                Icon(Icons.people, color: Colors.grey),
              ],
            ),
          );
        },
      ),
    );
  }
}
