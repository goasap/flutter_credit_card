class CreditCardModel {
  CreditCardModel(this.cardNumber, this.expiryDate, this.cardHolderName,
      this.cvvCode, this.isCvvFocused, this.phoneNumber, this.amount);

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  String phoneNumber = '';
  String amount = '';

  CreditCardModel copyWith(
          String cardNumber,
          String expiryDate,
          String cardHolderName,
          String cvvCode,
          bool isCvvFocused,
          String phoneNumber,
          String amount) =>
      CreditCardModel(
          cardNumber ?? this.cardNumber,
          expiryDate ?? this.expiryDate,
          cardHolderName ?? this.cardHolderName,
          cvvCode ?? this.cvvCode,
          isCvvFocused ?? this.isCvvFocused,
          phoneNumber ?? this.phoneNumber,
          amount ?? this.amount);
}
