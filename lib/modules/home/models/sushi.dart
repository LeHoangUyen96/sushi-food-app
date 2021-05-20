class Sushi {
  final String name, image, ingredient;
  final double price;
  final int id;
  final bool isFavorite;
  Sushi({
    this.name,
    this.image,
    this.price,
    this.ingredient,
    this.id,
    this.isFavorite,
  });
  factory Sushi.initialState() {
    return Sushi(
      image: '',
      name: '',
      ingredient: '',
      price: 0,
      id: 0,
      isFavorite: false,
    );
  }

  Sushi copyWith({
    String image,
    String name,
    double price,
    String ingredient,
    int id,
    bool isFavorite,
  }) {
    return Sushi(
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      ingredient: ingredient ?? this.ingredient,
      id: id ?? this.id,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object> get props => [
        image,
        name,
        ingredient,
        price,
        id,
        isFavorite,
      ];
}
