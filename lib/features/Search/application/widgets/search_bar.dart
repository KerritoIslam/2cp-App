import 'package:app/features/Search/application/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              onChanged: (val)=>context.read<SearchBloc>().add(SearchRequested(val)),
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
