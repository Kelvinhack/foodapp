import 'package:flutter/material.dart';

class AddressList extends StatelessWidget {
  final List<String> addresses;

  const AddressList({Key? key, required this.addresses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...addresses.map((address) => Card(
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text(address),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Edit'),
                      value: 'edit',
                    ),
                    PopupMenuItem(
                      child: Text('Delete'),
                      value: 'delete',
                    ),
                  ],
                  onSelected: (value) {
                    // TODO: Implement address actions
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Address management coming soon!'),
                      ),
                    );
                  },
                ),
              ),
            )),
        SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {
            // TODO: Implement add address
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Add address coming soon!')),
            );
          },
          icon: Icon(Icons.add),
          label: Text('Add New Address'),
        ),
      ],
    );
  }
}