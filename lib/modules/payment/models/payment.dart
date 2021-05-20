import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final String selectedPaymentMethod;

  factory Payment.initial() {
    return Payment(
      selectedPaymentMethod: 'credit',
    );
  }

  Payment({
    this.selectedPaymentMethod,
  });

  Payment copyWith({
    String selectedPaymentMethod,
  }) {
    return Payment(
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
    );
  }

  @override
  List<Object> get props => [
        selectedPaymentMethod,
      ];
}
