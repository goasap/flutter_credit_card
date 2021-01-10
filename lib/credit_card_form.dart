import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'credit_card_model.dart';
import 'flutter_credit_card.dart';

class CreditCardForm extends StatefulWidget {
  const CreditCardForm({
    Key key,
    this.cardNumber,
    this.expiryDate,
    this.cardHolderName,
    this.cvvCode,
    this.phoneNumber,
    this.amount,
    @required this.onCreditCardModelChange,
    this.themeColor,
    this.textColor = Colors.black,
    this.cursorColor,
    this.showHolderName = true,
    this.showPhoneNumber = true,
    this.localizedText = const LocalizedText(),
  })  : assert(localizedText != null),
        super(key: key);

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final String phoneNumber;
  final bool showHolderName;
  final bool showPhoneNumber;
  final String amount;
  final void Function(CreditCardModel) onCreditCardModelChange;
  final Color themeColor;
  final Color textColor;
  final Color cursorColor;
  final LocalizedText localizedText;

  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  String cardNumber;
  String expiryDate;
  String cardHolderName;
  String cvvCode;
  String phoneNumber;
  String amount;
  bool isCvvFocused = false;
  Color themeColor;

  void Function(CreditCardModel) onCreditCardModelChange;
  CreditCardModel creditCardModel;

  final MaskedTextControllerText _cardNumberController =
      MaskedTextControllerText(mask: '0000 0000 0000 0000');
  final TextEditingController _expiryDateController =
      MaskedTextControllerText(mask: '00/00');
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cvvCodeController =
      MaskedTextControllerText(mask: '0000');
  final TextEditingController _phoneNumberController = TextEditingController();
  final MoneyMaskedTextController _amountController =
      MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: '.');

  FocusNode cvvFocusNode = FocusNode();

  void textFieldFocusDidChange() {
    creditCardModel.isCvvFocused = cvvFocusNode.hasFocus;
    onCreditCardModelChange(creditCardModel);
  }

  void createCreditCardModel() {
    cardNumber = widget.cardNumber ?? '';
    expiryDate = widget.expiryDate ?? '';
    cardHolderName = widget.cardHolderName ?? '';
    cvvCode = widget.cvvCode ?? '';
    phoneNumber = widget.phoneNumber ?? '';
    amount = widget.amount ?? '';

    creditCardModel = CreditCardModel(cardNumber, expiryDate, cardHolderName,
        cvvCode, isCvvFocused, phoneNumber, amount);
  }

  @override
  void initState() {
    super.initState();

    createCreditCardModel();

    onCreditCardModelChange = widget.onCreditCardModelChange;

    cvvFocusNode.addListener(textFieldFocusDidChange);

    _cardNumberController.addListener(() {
      setState(() {
        cardNumber = _cardNumberController.text;
        creditCardModel.cardNumber = cardNumber;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _expiryDateController.addListener(() {
      setState(() {
        expiryDate = _expiryDateController.text;
        creditCardModel.expiryDate = expiryDate;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _cardHolderNameController.addListener(() {
      setState(() {
        cardHolderName = _cardHolderNameController.text;
        creditCardModel.cardHolderName = cardHolderName;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _cvvCodeController.addListener(() {
      setState(() {
        cvvCode = _cvvCodeController.text;
        creditCardModel.cvvCode = cvvCode;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _phoneNumberController.addListener(() {
      setState(() {
        phoneNumber = _phoneNumberController.text;
        creditCardModel.phoneNumber = phoneNumber;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _amountController.addListener(() {
      setState(() {
        amount = _amountController.text;
        creditCardModel.amount = amount;
        onCreditCardModelChange(creditCardModel);
      });
    });
  }

  @override
  void didChangeDependencies() {
    themeColor = widget.themeColor ?? Theme.of(context).primaryColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: themeColor.withOpacity(0.8),
        primaryColorDark: themeColor,
      ),
      child: Form(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: TextFormField(
                controller: _cardNumberController,
                cursorColor: widget.cursorColor ?? themeColor,
                style: TextStyle(
                  color: widget.textColor,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.localizedText.cardNumberLabel,
                  hintText: widget.localizedText.cardNumberHint,
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: TextFormField(
                controller: _expiryDateController,
                cursorColor: widget.cursorColor ?? themeColor,
                style: TextStyle(
                  color: widget.textColor,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.localizedText.expiryDateLabel,
                  hintText: widget.localizedText.expiryDateHint,
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: TextField(
                focusNode: cvvFocusNode,
                controller: _cvvCodeController,
                cursorColor: widget.cursorColor ?? themeColor,
                style: TextStyle(
                  color: widget.textColor,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.localizedText.cvvLabel,
                  hintText: widget.localizedText.cvvHint,
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onChanged: (String text) {
                  setState(() {
                    cvvCode = text;
                  });
                },
              ),
            ),
            (widget.showHolderName)
                ? Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
                    child: TextFormField(
                      controller: _cardHolderNameController,
                      cursorColor: widget.cursorColor ?? themeColor,
                      style: TextStyle(
                        color: widget.textColor,
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: widget.localizedText.cardHolderLabel,
                        hintText: widget.localizedText.cardHolderHint,
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  )
                : Container(),
            (widget.showPhoneNumber)
                ? Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
                    child: TextFormField(
                      controller: _phoneNumberController,
                      cursorColor: widget.cursorColor ?? themeColor,
                      style: TextStyle(
                        color: widget.textColor,
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: widget.localizedText.phoneNumberLabel,
                        hintText: widget.localizedText.phoneNumberHint,
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  )
                : Container(),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
                child: TextFormField(
                  controller: _amountController,
                  cursorColor: widget.cursorColor ?? themeColor,
                  style: TextStyle(
                    color: widget.textColor,
                  ),
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: widget.localizedText.amountLabel,
                      hintText: widget.localizedText.amountHint),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ))
          ],
        ),
      ),
    );
  }
}
