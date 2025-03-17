import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

late TextEditingController _skillsController;
List<String> _skills = [];

class _SkillsPageState extends State<SkillsPage> {
  @override
  void initState() {
    _skillsController = TextEditingController();
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
        child: Column(
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
                        label: Text(e),
                        onDeleted: () {
                          setState(() {
                            _skills.remove(e);
                          });
                        },
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
