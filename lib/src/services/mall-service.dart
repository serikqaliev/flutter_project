class Mall {
  String title;
  String description;
  String imgPath;
  String address;
  bool hasLike;

  setHasLike() {
    hasLike = !hasLike;
  }

  Mall({
    required this.title,
    required this.description,
    required this.imgPath,
    required this.address,
    required this.hasLike,
  });
}

class MallService {
  static List<Mall> mallData = [
    Mall(
      title: 'Esentail Mall',
      description:
          'Единственный люксовый молл в Центральной Азии с эксклюзивным ассортиментом брендов и товаров.',
      imgPath: 'assets/images/esentai.png',
      address: 'Аль-Фараби',
      hasLike: false,
    ),
    Mall(
      title: 'Mega Center',
      description:
          'Крупный торгово развлекательный центр в городе Алма-Ата (Казахстан).',
      imgPath: 'assets/images/mega.png',
      address: 'ул. Розыбакиева',
      hasLike: false,
    ),
    Mall(
      title: 'ADK',
      description:
          'Известный торговый центр с магазинами, фуд-кортом, кинотеатром, супермаркетом и игровой зоной для детей.',
      imgPath: 'assets/images/adk.png',
      address: 'ул. Сатпаева',
      hasLike: true,
    ),
    Mall(
      title: 'Forum',
      description:
          'Уникальный проект, разработанный по современной системе «город в городе».',
      imgPath: 'assets/images/forum.png',
      address: 'ул. Сатпаева',
      hasLike: false,
    ),
    Mall(
      title: 'Dostyk Plaza',
      description:
          'Масштабный, современный торгово-развлекательный центр, расположенный в центре Алматы, светлый и просторный дизайн.',
      imgPath: 'assets/images/dostykplaza.png',
      address: 'ул. Сатпаева',
      hasLike: false,
    ),
  ];
}
