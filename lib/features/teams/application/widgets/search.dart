import 'package:app/features/teams/application/bloc/teams_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColleaguesSearchBar extends StatefulWidget {
  const ColleaguesSearchBar({super.key});

  @override
  State<ColleaguesSearchBar> createState() => _ColleaguesSearchBarState();
}

class _ColleaguesSearchBarState extends State<ColleaguesSearchBar> {
  void _triggerSearch(String query) {
    context.read<TeamsBloc>().add(TeamsSearchForMembersEvent(query: query));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).shadowColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).secondaryHeaderColor),
              onChanged: _triggerSearch,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
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
