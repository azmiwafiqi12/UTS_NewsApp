class OnBoardingModel {
  String title;
  String description;
  String image;

  OnBoardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnBoardingModel> contents = [
  OnBoardingModel(
    title: 'Majalah digital terbaik.',
    description:
        'Mulai jelajahi topik berita terpanas di seluruh dunia bersama kami di mana saja.',
    image: 'assets/ob/ob1.png',
  ),
  OnBoardingModel(
    title: 'Dapatkan informasi terbaru tentang berita-berita pilihan',
    description:
        'Dapatkan berita terbaru yang dipilih oleh para editor sesuai dengan minat Anda dari seluruh dunia.',
    image: 'assets/ob/ob2.png',
  ),
  OnBoardingModel(
    title: 'Memperkaya pemahaman Anda tentang dunia.',
    description:
        'Berita terbaru dan terhangat dari seluruh dunia, membuat Anda lebih memahami lingkungan sekitar.',
    image: 'assets/ob/ob3.png',
  ),
];
