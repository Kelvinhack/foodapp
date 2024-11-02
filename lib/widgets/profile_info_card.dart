import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileInfoCard extends StatelessWidget {
  final User user;

  const ProfileInfoCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                    user.name[0].toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 4),
                      Text(
                        user.email,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // TODO: Implement edit profile
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Edit profile coming soon!')),
                    );
                  },
                ),
              ],
            ),
            Divider(height: 32),
            Row(
              children: [
                Icon(Icons.phone, size: 20, color: Colors.grey[600]),
                SizedBox(width: 8),
                Text(
                  user.phone,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}