class PortofolioModel {
  final String? category, title;
  final int? id;
  final List? image;

  PortofolioModel({this.id, this.image, this.category, this.title});
}

List<PortofolioModel> portodata = [
  PortofolioModel(
    id: 1,
    title:
        "Chat Application where you can have a one to one conversation or a group of chat ",
    category: "Mobile App",
    image: ["assets/chat.png", "assets/chat2.png", "assets/signupchat.png"],
  ),
  PortofolioModel(
    id: 2,
    title: "A simple Spends Check Application",
    category: "Spends Mobile App",
    image: ["assets/signingoogle.png", "assets/benjispends.png"],
  ),
  PortofolioModel(
    id: 3,
    title: "A fully fonctional eCommerce App ",
    category: "Shopping Mobile App",
    image: ["assets/flutter_01.png", "assets/flutter_02.png"],
  ),
  PortofolioModel(
    id: 4,
    title: "My Portfolio in Mobile",
    category: "Portofolio Mobile App & Web",
    image: ["assets/portofolio.png", "assets/portofolio2.png"],
  ),
];
