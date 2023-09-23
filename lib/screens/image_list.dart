import 'package:flutter/material.dart';
import 'package:training/screens/add_edit_image_data.dart';
import 'package:training/models/images_instance.dart';
import 'package:training/screens/image_details.dart';

import '../logics.dart';

class ImageList extends StatefulWidget {
  const ImageList({Key? key}) : super(key: key);

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;




    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddEditImageData(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('Image List'),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height / 1.1,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: imagesInstances.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
setState(() {
  showCustomDialog(context, index);

});                      },
                      child: Card(
                        child: ListTile(
                          leading: imagesInstances[index].imageFile != null
                              ? CircleAvatar(
                                  backgroundImage: FileImage(
                                      imagesInstances[index].imageFile!),
                                )
                              : imagesInstances[index].imageString != null
                                  ? CircleAvatar(
                                      backgroundImage: AssetImage(
                                          imagesInstances[index].imageString!),
                                    )
                                  : const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/no_image.png'),
                                    ),
                          title: Text(imagesInstances[index].imageTitle!),
                          subtitle:
                              Text(imagesInstances[index].imageDescription!,
                              maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                          trailing: DropdownButton(
                            underline: const SizedBox(),
                            icon: const Icon(Icons.menu),
                            items: itemsList
                                .map<DropdownMenuItem<String>>(
                                    (String itemsList) =>
                                    DropdownMenuItem<String>(
                                      value: itemsList,
                                      child: Text(itemsList),
                                    ))
                                .toList(),
                            onChanged: (itemsList) {
                              switch (itemsList) {
                                case 'Edit Data':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddEditImageData(
                                        index: index,
                                      ),
                                    ),
                                  );
                                  break;
                                case 'Delete Data':
                                  setState(() {
                                    deleteItem(index);
                                  });

                                  break;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
