class Category {
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['courses'], item['image']))
    .toList();

var categoriesData = [
  {"name": "Marketing", "courses": 17, 'image': "assets/images/marketing.png"},
  {"name": "Ux Design", "courses": 25, 'image': "assets/images/ux_design.png"},
  {
    "name": "photography",
    "courses": 13,
    'image': "assets/images/photography.png"
  },
  {"name": "Business", "courses": 12, 'image': 'assets/images/business.png'}
];
