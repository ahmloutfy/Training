import 'dart:io';

class ImagesInstances {
  int? id;
  double? itemPrice;
  File? imageFile;
  String? imageString;
  String? imageTitle;
  String? imageDescription;
  int itemCount = 1;

  ImagesInstances(
      {this.itemPrice , this.imageTitle, this.id, this.imageFile, this.imageDescription , this.imageString});
}

List<ImagesInstances> imagesInstances = [
  ImagesInstances(
    id: 1,
    imageTitle: 'Apples',
    imageDescription: 'Apples are a popular fruit known for their sweet and crisp taste. They come in various varieties and colors, making them a versatile choice for snacking or incorporating into both sweet and savory dishes.',
    imageString: 'assets/images/apples.jpg',
    itemPrice: 4.95,
  ),
  ImagesInstances(
    id: 2,
    imageTitle: 'Bread',
    imageDescription: 'Bread is a staple food made from wheat or other grains, typically baked in various forms such as loaves or rolls. It serves as a fundamental part of many diets worldwide and can be enjoyed plain, toasted, or used for sandwiches.',
    imageString: 'assets/images/bread.jpg',
    itemPrice: 8.54,
  ),
  ImagesInstances(
    id: 3,
    imageTitle: 'Eggs',
    imageDescription: 'Eggs are a versatile and nutritious food source. They are a rich source of protein and can be prepared in numerous ways, including scrambled, boiled, fried, or used as an ingredient in baking and cooking.',
    imageString: 'assets/images/eggs.jpg',
    itemPrice: 7.95,
  ),
  ImagesInstances(
    id: 4,
    imageTitle: 'Milk',
    imageDescription: 'Milk is a dairy product that provides essential nutrients like calcium and vitamin D. It is commonly consumed as a beverage and is also used to make various dairy products such as yogurt, cheese, and butter.',
    imageString: 'assets/images/milk.jpg',
    itemPrice: 3.36,
  ),
  ImagesInstances(
    id: 5,
    imageTitle: 'Orange',
    imageDescription: 'Oranges are a citrus fruit known for their refreshing and tangy flavor. They are an excellent source of vitamin C and can be eaten fresh, juiced, or used in a wide range of culinary applications, from salads to desserts.',
    imageString: 'assets/images/oranges.jpg',
    itemPrice: 8.54,
  ),
  ImagesInstances(
    id: 5,
    imageTitle: 'Orange',
    imageDescription: 'Some oranges',
    imageString: 'assets/images/oranges.jpg',
    itemPrice: 8.54,
  ),
  ImagesInstances(
    id: 5,
    imageTitle: 'Orange',
    imageDescription: 'Some oranges',
    imageString: 'assets/images/oranges.jpg',
    itemPrice: 8.54,
  ),
];
