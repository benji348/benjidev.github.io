class ServicesModel {
  final String imagePath;
  final String title;
  final int id;

  ServicesModel({
    required this.imagePath,
    required this.title,
    required this.id,
  });
}

List<ServicesModel> services = [
  ServicesModel(
    imagePath: 'assets/flutter.png',
    title: 'Flutter Developer',
    id: 1,
  ),
  ServicesModel(
    imagePath: 'assets/desktop.png',
    title: 'Back end developer(Java)',
    id: 2,
  ),
  ServicesModel(
    imagePath: 'assets/graphic.png',
    title: 'Mobile Apps',
    id: 3,
  ),
  ServicesModel(
    imagePath: 'assets/ui.png',
    title: 'UI design',
    id: 4,
  ),
];
