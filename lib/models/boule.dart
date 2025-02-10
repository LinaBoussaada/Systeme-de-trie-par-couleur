class Boule {
  final int bouleId;
  final String color;
  final String imageURL;
  bool isFavorated;
  bool isSelected;
  Boule(
      {required this.bouleId,
      required this.color,
      required this.imageURL,
      required this.isFavorated,
      required this.isSelected});

  //List of Plants data
  static List<Boule> bouleList = [
    Boule(
        bouleId: 0,
        color: 'red',
        imageURL: 'assets/images/boule_rouge.png',
        isFavorated: true,
        isSelected: false),
    Boule(
        bouleId: 1,
        color: 'blue',
        imageURL: 'assets/images/boule_bleu.png',
        isFavorated: true,
        isSelected: false),
    Boule(
        bouleId: 2,
        color: 'vert',
        imageURL: 'assets/images/boule_verte.png',
        isFavorated: true,
        isSelected: false),
    Boule(
        bouleId: 3,
        color: 'jaune',
        imageURL: 'assets/images/boule_jaune.png',
        isFavorated: true,
        isSelected: false),
  ];

  //Get the favorated items
  static List<Boule> getFavoritedBoule() {
    List<Boule> _travelList = Boule.bouleList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Boule> addedToCartBoule() {
    List<Boule> _selectedBoule = Boule.bouleList;
    return _selectedBoule
        .where((element) => element.isSelected == true)
        .toList();
  }
}
