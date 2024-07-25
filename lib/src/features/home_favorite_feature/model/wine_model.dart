class Wine {
  final int id;
  final String name;
  final int year;
  final String country;
  final String type;
  final String description;
  final String imageURL;
  final double volume;
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

  factory Wine.fromJson(Map<String, dynamic> json) {
      var flavoursFromJson = json['flavours'] as List? ?? [];
      var fitsToFromJson = json['fitsTo'] as List? ?? [];
      var supermarketsFromJson = json['supermarkets'] as List? ?? [];
  
      List<String> flavoursList = flavoursFromJson.map((i) => i as String).toList();
      List<String> fitsToList = fitsToFromJson.map((i) => i as String).toList();
      List<Supermarket> supermarketsList = supermarketsFromJson.map((i) => Supermarket.fromJson(i as Map<String, dynamic>)).toList();
  
      return Wine(
        id: json['id'] as int,
        name: json['name'] as String,
        year: json['year'] as int,
        country: json['country'] as String,
        type: json['type'] as String,
        description: json['description'] as String,
        imageURL: json['imageURL'] as String,
        volume: (json['volume'] as num).toDouble(),
        volAlc: (json['volAlc'] as num).toDouble(),
        isLiked: json['isLiked'] as bool,
        dryness: (json['dryness'] as num).toDouble(),
        acidity: (json['acidity'] as num).toDouble(),
        tanninLevel: (json['tanninLevel'] as num).toDouble(),
        flavours: flavoursList,
        fitsTo: fitsToList,
        supermarkets: supermarketsList,
      );
    }
}

class Supermarket {
  final String name;
  final String street;
  final String postalCode;
  final String city;
  final String houseNumber;
  final double price;

  Supermarket({
    required this.name,
    required this.street,
    required this.postalCode,
    required this.city,
    required this.houseNumber,
    required this.price,
  });

  factory Supermarket.fromJson(Map<String, dynamic> json) {
      return Supermarket(
        name: json['name'].toString(),
        street: json['street'].toString(),
        postalCode: json['postal_code'].toString(),
        city: json['city'].toString(),
        houseNumber: json['house_number'].toString(),
        price: (json['price'] as num).toDouble(),
      );
    }
}
