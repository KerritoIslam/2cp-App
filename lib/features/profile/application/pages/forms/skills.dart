import 'package:app/features/authentication/application/bloc/auth_bloc.dart';
import 'package:app/features/authentication/application/bloc/auth_events.dart';
import 'package:app/features/authentication/application/bloc/auth_state.dart';
import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

late User user;
late TextEditingController _skillsController;
List<String> _skills = [];

class _SkillsPageState extends State<SkillsPage> {
  @override
  void initState() {
    _skillsController = TextEditingController();
    user = (context.read<AuthBloc>().state as Authenticated).user;

    _skills = List.from(user.skills);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _skillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Add Skills',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 300.w,
                    child: TextField(
                      onChanged: (value) => setState(() {}),
                      controller: _skillsController,
                      cursorColor: Color(0xFF5BA470),
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        hintText: 'Add Skills',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF5BA470)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF5BA470)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _skillsController.text.isNotEmpty,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (_skills.contains(_skillsController.text)) return;
                          _skills.add(_skillsController.text);
                          _skillsController.clear();
                        });
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/add.svg',
                        width: 40.w,
                        height: 40.h,
                      ),
                      color: Color(0xFF5BA470),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Wrap(
                children: _skills
                    .map(
                      (e) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(width: 0)),
                          backgroundColor: Theme.of(context).dividerColor,
                          label: Text(e,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white)),
                          onDeleted: () {
                            setState(() {
                              _skills.remove(e);
                            });
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 100.h,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () async {
                    //todo: edit the return value

                    context
                        .read<AuthBloc>()
                        .add(AuthUserUpdated(user.copyWith(skills: _skills)));
                    context.go('/protected/profile');
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Color(0xFF5BA470)),
                    padding: WidgetStateProperty.all(
                      EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Save',
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
