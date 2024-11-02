import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/address_list.dart';
import '../widgets/order_history_list.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.read<AuthProvider>().logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          if (!auth.isAuthenticated) {
            return Center(child: Text('Please login to view profile'));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileInfoCard(user: auth.user!),
                SizedBox(height: 24),
                Text(
                  'Saved Addresses',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 8),
                AddressList(addresses: auth.user!.addresses),
                SizedBox(height: 24),
                Text(
                  'Order History',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 8),
                OrderHistoryList(),
              ],
            ),
          );
        },
      ),
    );
  }
}