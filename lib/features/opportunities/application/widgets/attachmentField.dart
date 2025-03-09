import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart' as path;

class AttachmentField extends StatefulWidget {
  final String hintText;
  final List<String>? allowedExtensions;
  final int? maxFileSizeInMB;
  final Function(File file)? onFileSelected;
  final Function(File file)? onFileRemoved;

  // ignore: use_super_parameters
  const AttachmentField({
    Key? key,
    this.hintText = 'Add Attachment',
    this.allowedExtensions,
    this.maxFileSizeInMB = 10,
    this.onFileSelected,
    this.onFileRemoved,
  }) : super(key: key);

  @override
  State<AttachmentField> createState() => _AttachmentFieldState();
}

class _AttachmentFieldState extends State<AttachmentField> {
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
              _errorMessage = 'File size exceeds ${widget.maxFileSizeInMB} MB limit';
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
        Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).secondaryHeaderColor.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: _selectedFile == null
                      ? Text(
                          widget.hintText,
                          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
                        )
                      : Text(
                          path.basename(_selectedFile!.path),
                          style: TextStyle(color: Theme.of(context).secondaryHeaderColor,),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
              ),
              SizedBox(
                height: 50.h,
                width: 120.w,
                                child: _selectedFile == null
                    ? TextButton.icon(
                        onPressed: _pickFile,
                        icon: Icon(Icons.attach_file, size: 18,color: Theme.of(context).primaryColor,),
                        label: Text('Attach',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.8
                  ),),),
                        style: ButtonStyle(

                          backgroundColor:WidgetStatePropertyAll(Colors.transparent) ,
                    foregroundColor: WidgetStatePropertyAll(Colors.grey[600]),

                  
                  )
                      )
                    : IconButton(
                        icon: const Icon(Icons.close, size: 18,color: Colors.red,),
                        onPressed: _removeFile,
                        color: Colors.transparent,
                      ),
              ),
            ],
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
