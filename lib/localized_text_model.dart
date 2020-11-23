class LocalizedText {
  const LocalizedText(
      {this.cardNumberLabel = _cardNumberLabelDefault,
      this.cardNumberHint = _cardNumberHintDefault,
      this.expiryDateLabel = _expiryDateLabelDefault,
      this.expiryDateHint = _expiryDateHintDefault,
      this.cvvLabel = _cvvLabelDefault,
      this.cvvHint = _cvvHintDefault,
      this.cardHolderLabel = _cardHolderLabelDefault,
      this.cardHolderHint = _cardHolderHintDefault,
      this.phoneNumberLabel = _phoneNumberLabelDefault,
      this.phoneNumberHint = _phoneNumberHintDefault});

  static const String _cardNumberLabelDefault = 'Card number';
  static const String _cardNumberHintDefault = 'xxxx xxxx xxxx xxxx';
  static const String _expiryDateLabelDefault = 'Expiry Date';
  static const String _expiryDateHintDefault = 'MM/AA';
  static const String _cvvLabelDefault = 'CVV';
  static const String _cvvHintDefault = 'XXXX';
  static const String _cardHolderLabelDefault = 'Nombre del titular';
  static const String _cardHolderHintDefault = '';
  static const String _phoneNumberLabelDefault = 'Phone number';
  static const String _phoneNumberHintDefault = '';

  final String cardNumberLabel;
  final String cardNumberHint;
  final String expiryDateLabel;
  final String expiryDateHint;
  final String cvvLabel;
  final String cvvHint;
  final String cardHolderLabel;
  final String cardHolderHint;
  final String phoneNumberLabel;
  final String phoneNumberHint;
}
