class Category {
  final String icon, title;

  Category({required this.icon, required this.title});
}

List<Category> demo_categories = [
  Category(
    icon: "assets/icons/dress.svg",
    title: "Vegetables",
  ),
  Category(
    icon: "assets/icons/shirt.svg",
    title: "Fruits",
  ),
  Category(
    icon: "assets/icons/pants.svg",
    title: "Grains",
  ),
  Category(
    icon: "assets/icons/Tshirt.svg",
    title: "Others",
  ),
];