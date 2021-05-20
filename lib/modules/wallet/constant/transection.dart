final List<Map<String, dynamic>> transection = [
  {
    'name': 'Kani Maki',
    'money': '9.80',
    'time': DateTime(2020, 11, 10),
    'number': '4.9 x2',
  },
  {
    'name': 'Fresh Salmon',
    'money': '12.30',
    'time': DateTime(2020, 12, 18),
    'number': '4.1 x3',
  },
  {
    'name': 'Maguro nigiri',
    'money': '20.00',
    'time': DateTime(2021, 42, 28),
    'number': '4.0 x5',
  },
  {
    'name': 'Smoked Salmon',
    'money': '4.70',
    'time': DateTime(2021, 4, 15),
    'number': '4.7 x1',
  },
];

class Transection {
  String name;
  String money;
  DateTime time;
  String number;
  Transection({
    this.name,
    this.money,
    this.time,
    this.number,
  });
}
