import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:training/logics.dart';
import '../models/images_instance.dart';

class AddEditImageData extends StatefulWidget {
  final int? index;

  const AddEditImageData({super.key, this.index});

  @override
  State<AddEditImageData> createState() => _AddEditImageDataState();
}




class _AddEditImageDataState extends State<AddEditImageData> {



  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      // Populate fields with existing data for editing
      final imageInstance = imagesInstances[widget.index!];
      imageTitleController.text = imageInstance.imageTitle ?? '';
      imageDescriptionController.text = imageInstance.imageDescription ?? '';
      selectedFileImage = imageInstance.imageFile;
    }

  }

  void resetFields() {
    imageTitleController.clear();
    imageDescriptionController.clear();
    selectedFileImage = null;
  }

  void navigateBack() {
    Navigator.pop(context); // Navigate back after saving
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title:  Text( (widget.index != null) ? 'Edit Image' : 'Add New Image'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Add Image Data'),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text('Add Image'),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            pickImage(ImageSource.gallery).then((pickedImage) {
                              if (pickedImage != null) {
                                setState(() {
                                });
                              }
                            });
                          },
                          child: const Text('From Gallery'),
                        ),
                        ElevatedButton(
                          onPressed: ()  {
                            pickImage(ImageSource.camera).then((pickedImage) {
                              if (pickedImage != null) {
                                setState(() {
                                });
                              }
                            });
                          },
                          child: const Text('From Camera'),
                        ),
                      ],
                    ),
                    if (selectedFileImage != null) SizedBox(
                      width: 120,
                      height: 120,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(selectedFileImage!),
                      ),
                    ) else if (selectedFileImage == null && widget.index != null) SizedBox(
                      width: 120,
                      height: 120,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(imagesInstances[widget.index!].imageString!),
                      ),
                    ) else const SizedBox(
                      width: 120,
                      height: 120,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/no_image.png'),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Add Image Title'),
                    TextFormField(
                      controller: imageTitleController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Add Image Description'),
                    TextFormField(
                      controller: imageDescriptionController,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (widget.index != null) {
                       saveEditedItem(widget.index!);

                    } else {
                         addImageInstance(context);

                    }

                    Navigator.pop(context);

                                },
                  child: Text((widget.index != null) ? 'Submit Edited Image Instance' : 'Submit New Image Instance'))
            ],
          ),
        ));
  }
}
