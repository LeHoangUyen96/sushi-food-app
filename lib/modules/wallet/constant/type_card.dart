final List<Map<String, String>> typeCard = [
  {
    'name': 'Visa Card',
    'balance': '**** **** **** 1234',
    'image': 'assets/icons/visa-card.png',
  },
  {
    'name': 'Master',
    'balance': '**** **** **** 5801',
    'image': 'assets/icons/master-card.png',
  },
  {
    'name': 'Gift Card',
    'balance': '**** **** **** 1968',
    'image': 'assets/icons/gift-card.png',
  },
];

class Transection {
  String name;
  String balance;
  DateTime image;
  Transection({
    this.name,
    this.balance,
    this.image,
  });
}
