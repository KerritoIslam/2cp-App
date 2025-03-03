import 'package:flutter/material.dart';

class CoolSearchBar extends StatelessWidget {
  const CoolSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).shadowColor.withOpacity(0.2), // Light gray background
        borderRadius: BorderRadius.circular(25), // Rounded corners
      ),
      child: Row(
        children: [
          // Search Icon
          Icon(
            Icons.search,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 10),
          
          // Search TextField
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: InputBorder.none, // Removes the default underline
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          
          // Filter/Options Icon Button
          //Container(
          //  padding: const EdgeInsets.all(8),
          //  decoration: BoxDecoration(
          //    color: Colors.green[300], // Light green background for the icon
          //    borderRadius: BorderRadius.circular(12),
          //  ),
          //  child: const Icon(
          //    Icons.tune, // Filter/options icon
          //    color: Colors.white,
          //    size: 20,
          //  ),
          //),
        ],
      ),
    );
  }
}
