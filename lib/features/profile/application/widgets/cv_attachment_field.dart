import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

class CvAttachmentField extends StatefulWidget {
  final String hintText;
  final List<String>? allowedExtensions;
  final int? maxFileSizeInMB;
  final Function(File file)? onFileSelected;
  final Function(File file)? onFileRemoved;

  // ignore: use_super_parameters
  const CvAttachmentField({
    Key? key,
    this.hintText = 'Upload CV/Resume',
    this.allowedExtensions = const ['pdf'],
    this.maxFileSizeInMB = 5,
    this.onFileSelected,
    this.onFileRemoved,
  }) : super(key: key);

  @override
  State<CvAttachmentField> createState() => _CvAttachmentFieldState();
}

class _CvAttachmentFieldState extends State<CvAttachmentField> {
  File? _selectedFile;
  String? _errorMessage;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: widget.allowedExtensions != null ? FileType.custom : FileType.any,
        allowedExtensions: widget.allowedExtensions,
      );

      if (result != null) {
        File file = File(result.files.single.path!);

        // Check file size
        if (widget.maxFileSizeInMB != null) {
          final fileSizeInBytes = await file.length();
          final fileSizeInMB = fileSizeInBytes / (1024 * 1024);

          if (fileSizeInMB > widget.maxFileSizeInMB!) {
            setState(() {
              _errorMessage =
                  'File size exceeds ${widget.maxFileSizeInMB} MB limit';
            });
            return;
          }
        }

        setState(() {
          _selectedFile = file;
          _errorMessage = null;
        });

        if (widget.onFileSelected != null) {
          widget.onFileSelected!(file);
        }
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error selecting file: ${e.toString()}';
      });
    }
  }

  void _removeFile() {
    if (_selectedFile != null && widget.onFileRemoved != null) {
      widget.onFileRemoved!(_selectedFile!);
    }

    setState(() {
      _selectedFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DottedBorder(
          color: Theme.of(context).dividerColor,
          strokeWidth: 1,
          radius: Radius.circular(15),
          borderType: BorderType.RRect,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            width: 366.w,
            decoration: BoxDecoration(
              color: _selectedFile == null
                  ? const Color.fromRGBO(0, 0, 0, 0)
                  : Color(0x889D97B5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: _pickFile,
                    icon: _selectedFile != null &&
                            path.extension(_selectedFile!.path) == '.pdf'
                        ? SvgPicture.asset(
                            'assets/icons/pdf_file.svg',
                            height: 50.h,
                            width: 50.w,
                          )
                        : SvgPicture.asset(
                            'assets/icons/filepick.svg',
                            height: 40.h,
                            width: 40.w,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                    label: SizedBox(
                      width: 200.w,
                      child: _selectedFile == null
                          ? Text(
                              widget.hintText,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            )
                          : Column(
                              children: [
                                Text(
                                  path.basename(_selectedFile!.path),
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '${(_selectedFile!.lengthSync() / 1024).toStringAsFixed(2)} KB.${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())}',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  maxLines: 4,
                                ),
                              ],
                            ),
                    ),
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                    ),
                  ),
                  Visibility(
                    visible: _selectedFile != null,
                    child: TextButton.icon(
                      onPressed: _removeFile,
                      label: Text('Remove file',
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      icon: SvgPicture.asset('assets/icons/delete.svg',
                          width: 30.w, height: 30.h),
                      style: ButtonStyle(
                        overlayColor: WidgetStateProperty.all(
                            Colors.transparent), // Removes splash effect
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
