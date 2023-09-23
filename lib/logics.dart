import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:training/models/images_instance.dart';


TextEditingController imageTitleController = TextEditingController();

TextEditingController imageDescriptionController = TextEditingController();

FocusNode imageTitleFocus = FocusNode();

FocusNode imageDescriptionFocus = FocusNode();

File? selectedFileImage;

String? selectedAssetImage;

Future pickImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: source);

  if (pickedImage != null) {
    selectedFileImage = File(pickedImage.path);
    return selectedFileImage;
  }
  return null;

}

void addImageInstance(BuildContext context) {
  imageTitleFocus.requestFocus();
  imageDescriptionFocus.requestFocus();
  if (selectedFileImage != null &&
      imageTitleController.text.isNotEmpty &&
      imageDescriptionController.text.isNotEmpty) {
    final newImageInstance = ImagesInstances(
      id: imagesInstances.length + 1,
      imageTitle: imageTitleController.text,
      imageDescription: imageDescriptionController.text,
      imageFile: File(selectedFileImage!.path),
    );
    imagesInstances.add(newImageInstance);

    // Clear fields after submission
    selectedFileImage = null;
    imageTitleController.clear();
    imageDescriptionController.clear();
    imageTitleFocus.unfocus();
    imageDescriptionFocus.unfocus();
  }
}

void editItem(BuildContext context, int index) {
  imageTitleFocus.requestFocus();
  imageDescriptionFocus.requestFocus();
  if (selectedFileImage != null) {
    imagesInstances[index].imageFile = selectedFileImage;
  }
  // Set initial values for editing
  imageTitleController.text = imagesInstances[index].imageTitle!;
  imageDescriptionController.text = imagesInstances[index].imageDescription!;
  imageTitleController.clear();
  imageDescriptionController.clear();
  imageTitleFocus.unfocus();
  imageDescriptionFocus.unfocus();
}

void saveEditedItem(int index) {
  if (selectedFileImage != null && imageTitleController.text.isNotEmpty &&
      imageDescriptionController.text.isNotEmpty) {
    // Update the values of the item
    imagesInstances[index].imageFile = File(selectedFileImage!.path) ;
    imagesInstances[index].imageTitle = imageTitleController.text;
    imagesInstances[index].imageDescription = imageDescriptionController.text;

    // Clear editCard and fields after saving
    imageTitleController.clear();
    imageDescriptionController.clear();
    selectedFileImage = null;
    imageTitleFocus.unfocus();
    imageDescriptionFocus.unfocus();
  } else if (selectedFileImage == null && imagesInstances[index].imageString !=null && imageTitleController.text.isNotEmpty &&
      imageDescriptionController.text.isNotEmpty) {

    // Update the values of the item
    imagesInstances[index].imageString = selectedAssetImage;
    imagesInstances[index].imageTitle = imageTitleController.text;
    imagesInstances[index].imageDescription = imageDescriptionController.text;

    // Clear editCard and fields after saving
    imageTitleController.clear();
    imageDescriptionController.clear();
    selectedFileImage = null;
    imageTitleFocus.unfocus();
    imageDescriptionFocus.unfocus();
  }
}

void deleteItem(int index) {
  imagesInstances.removeAt(index);
}


List<String> itemsList = [
  'Edit Data',
  'Delete Data',
];