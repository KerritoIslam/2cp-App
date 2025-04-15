import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InvitationsPage extends StatefulWidget {
  const InvitationsPage({super.key});

  @override
  State<InvitationsPage> createState() => _InvitationsPageState();
}

List<Map<String, dynamic>> invitations = [
  {"name": "Ammou", "date": "2023-10-01", "pic": ""}
];

class _InvitationsPageState extends State<InvitationsPage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Your ',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                  children: [
                    TextSpan(
                      text: "Invitations",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).primaryColor,
                              ),
                    ),
                  ],
                )),
            SvgPicture.asset(
              'assets/images/invitations.svg',
              height: 377,
              width: 356,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "invitations",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...invitations.map((invitation) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(invitation["pic"]),
                ),
                title: RichText(
                    text: TextSpan(
                  text: '${invitation["name"]}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                  children: [
                    TextSpan(
                      text: " invited you to join\nhis team",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                )),
                subtitle: Text(invitation["date"],
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w200,
                          color: Theme.of(context).secondaryHeaderColor,
                        )),
                trailing: SizedBox(
                  width: 144.w,
                  height: 40.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "join",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 74.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Delete",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))),
                        ],
        ),
      ),
    );
  }
}
