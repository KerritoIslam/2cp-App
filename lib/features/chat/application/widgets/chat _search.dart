import 'package:app/features/chat/application/pages/company_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatSearchBar extends StatefulWidget {
  final bool isSearch;
  final TextEditingController? controller;
  final Function(String)? onSearch;

  const ChatSearchBar({
    super.key,
    this.isSearch = false,
    this.controller,
    this.onSearch,
  });

  @override
  State<ChatSearchBar> createState() => _ChatSearchBarState();
}

class _ChatSearchBarState extends State<ChatSearchBar> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    if (widget.isSearch) {
      _focusNode.requestFocus();
      print('focusNode: ${_focusNode.hasFocus}');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Theme.of(context).shadowColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.grey[600],
              size: 24.r,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: TextField(
                focusNode: _focusNode,
                controller: widget.controller,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                onChanged: widget.onSearch,
                readOnly: !widget.isSearch,
                onTap: widget.isSearch
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CompanySearchPage()),
                        );
                      },
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: 'Search companies...',
                  hintStyle: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
