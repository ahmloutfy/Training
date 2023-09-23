import 'package:flutter/material.dart';
import 'package:training/models/images_instance.dart';

class CustomDialog extends StatefulWidget {
  final int selectedIndex;

  const CustomDialog({super.key, required this.selectedIndex});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {

  void addItem(int index) {
    setState(() {
      imagesInstances[index].itemCount++;
    });
  }

  void removeItem(int index) {
    setState(() {
      if (imagesInstances[index].itemCount > 1) {
        imagesInstances[index].itemCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Stack(
          children: [

            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                imagesInstances[widget.selectedIndex].imageString!,
                width: size.width, // Stretch to the entire width
                height: size.height * 0.4,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              imagesInstances[widget.selectedIndex].imageTitle!,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              imagesInstances[widget.selectedIndex].imageDescription!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Stack(

                children: [
                  Text(

                    'EPG ${imagesInstances[widget.selectedIndex].itemPrice.toString()}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 10,
                    child: FittedBox(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1, 3),
                              blurRadius: 4,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                removeItem(widget.selectedIndex);
                              },
                              icon: Icon(
                                Icons.remove,
                                color: imagesInstances[widget.selectedIndex].itemCount > 1
                                    ? const Color(0xffE66219)
                                    : const Color(0xffFECDB4),
                              ),
                            ),
                            Text(
                              '${imagesInstances[widget.selectedIndex].itemCount}',
                              style: const TextStyle(fontSize: 25),
                            ),
                            IconButton(
                              color: const Color(0xffE66219),
                              // Default color
                              onPressed: () {
                                addItem(widget.selectedIndex);
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
        child: Text('A'),
        ),
      ],
    );
  }
}

void showCustomDialog(BuildContext context, int selectedIndex) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
    ),
    isScrollControlled: true, // Use isScrollControlled
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.only(top: 44),
          child: CustomDialog(selectedIndex: selectedIndex),
        ),
      );
    },
  );
}
