class CreditCardModel {
  CreditCardModel(
      this.cardNumber,
      this.expiryDate,
      this.cardHolderName,
      this.cvvCode,
      this.isCvvFocused,
      this.phoneNumber,
      this.amount,
      this.email);

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  String phoneNumber = '';
  String cardEmail = '';
  String amount = '';
  String email = '';

  CreditCardModel copyWith(
          {String cardNumber,
          String expiryDate,
          String cardHolderName,
          String cvvCode,
          bool isCvvFocused,
          String phoneNumber,
          String amount,
          String email}) =>
      CreditCardModel(
          cardNumber ?? this.cardNumber,
          expiryDate ?? this.expiryDate,
          cardHolderName ?? this.cardHolderName,
          cvvCode ?? this.cvvCode,
          isCvvFocused ?? this.isCvvFocused,
          phoneNumber ?? this.phoneNumber,
          amount ?? this.amount,
          email ?? this.email);
}
