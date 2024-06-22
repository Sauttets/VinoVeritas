class Wine {
  final int id;
  final String name;
  final int year;
  final String country;
  final String type;
  final String description;
  final String imageURL;
  final int volume;
  final double volAlc;
  final bool isLiked;
  final double dryness;
  final double acidity;
  final double tanninLevel;
  final List<String> flavours;
  final List<String> fitsTo;
  final List<Supermarket> supermarkets;

  Wine({
    required this.id,
    required this.name,
    required this.year,
    required this.country,
    required this.type,
    required this.description,
    required this.imageURL,
    required this.volume,
    required this.volAlc,
    required this.isLiked,
    required this.dryness,
    required this.acidity,
    required this.tanninLevel,
    required this.flavours,
    required this.fitsTo,
    required this.supermarkets,
  });
}

class Supermarket {
  final String name;
  final String street;
  final String postalCode;
  final String city;
  final String houseNumber;
  final double price;
  final String img;

  Supermarket({
    required this.name,
    required this.street,
    required this.postalCode,
    required this.city,
    required this.houseNumber,
    required this.price,
    required this.img,
  });
}
