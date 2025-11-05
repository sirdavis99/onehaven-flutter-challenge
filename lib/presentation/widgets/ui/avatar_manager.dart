import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarManager extends StatefulWidget {
  final String? initialUrl;
  final Function(File) onFileSelected;
  final double size;
  final Widget? placeholder;

  const AvatarManager({
    this.initialUrl,
    required this.onFileSelected,
    this.size = 100.0,
    this.placeholder,
    super.key,
  });

  @override
  _AvatarManagerState createState() => _AvatarManagerState();
}

class _AvatarManagerState extends State<AvatarManager> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _selectImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      widget.onFileSelected(_imageFile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget avatar;
    if (_imageFile != null) {
      avatar = Image.file(
        _imageFile!,
        fit: BoxFit.cover,
      );
    } else if (widget.initialUrl != null) {
      avatar = Image.network(
        widget.initialUrl!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error);
        },
      );
    } else {
      avatar =
          widget.placeholder ?? Icon(Icons.add_a_photo, size: widget.size / 2);
    }

    return GestureDetector(
      onTap: _selectImage,
      child: ClipOval(
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: avatar,
        ),
      ),
    );
  }
}
