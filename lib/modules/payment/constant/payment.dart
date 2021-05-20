final Map<String, PaymentMethod> methodList = {
  'credit': PaymentMethod(
    description: 'Pay with Visacard or Master',
    image: 'assets/icons/credit.png',
    name: 'Credit Card',
  ),
  'internet': PaymentMethod(
    description: 'Pay directly from your bank account',
    image: 'assets/icons/banking.png',
    name: 'Internet Banking',
  ),
  'cash': PaymentMethod(
    description: 'Pay the shipper',
    image: 'assets/icons/coins.png',
    name: 'Cash the Shipper',
  ),
};

class PaymentMethod {
  final String image;
  final String name;
  final String description;

  PaymentMethod({
    this.image,
    this.name,
    this.description,
  });
}
