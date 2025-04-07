import 'package:flutter/material.dart';

class ColleaguesSearchBar extends StatefulWidget {
  const ColleaguesSearchBar({super.key});

  @override
  State<ColleaguesSearchBar> createState() => _ColleaguesSearchBarState();
}

class _ColleaguesSearchBarState extends State<ColleaguesSearchBar> {
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
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).secondaryHeaderColor),
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Theme
                .of(context).secondaryHeaderColor,),
                border: InputBorder.none, // Removes the default underline
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          
        
        ],
      ),
    );
  }
}