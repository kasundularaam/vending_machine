import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../data/models/new_cart_item.dart';
import '../../../../../logic/cubit/purchase_cubit/purchase_cubit.dart';
import '../../../../router/app_router.dart';
import '../../../auth/widgets/auth_button.dart';

class CardDetailsForm extends StatefulWidget {
  final Function onValidPress;
  const CardDetailsForm({
    Key? key,
    required this.onValidPress,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CardDetailsFormState();
  }
}

class CardDetailsFormState extends State<CardDetailsForm> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;

  onValidPress() => widget.onValidPress();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(5.w))),
      child: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            obscureCardNumber: true,
            obscureCardCvv: true,
            isHolderNameVisible: true,
            cardBgColor: Colors.red,
            backgroundImage: 'assets/card_bg.png',
            isSwipeGestureEnabled: true,
            onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            customCardTypeIcons: <CustomCardTypeIcon>[
              CustomCardTypeIcon(
                cardType: CardType.mastercard,
                cardImage: Image.asset(
                  'assets/mastercard.png',
                  height: 48,
                  width: 48,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              CreditCardForm(
                formKey: formKey,
                obscureCvv: true,
                obscureNumber: true,
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardHolderName: cardHolderName,
                expiryDate: expiryDate,
                themeColor: Colors.orange,
                textColor: Colors.black,
                cardNumberDecoration: InputDecoration(
                  labelText: 'Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                  hintStyle: const TextStyle(color: AppColors.darkElv1),
                  labelStyle: const TextStyle(color: AppColors.darkElv0),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                expiryDateDecoration: InputDecoration(
                  hintStyle: const TextStyle(color: AppColors.darkElv1),
                  labelStyle: const TextStyle(color: AppColors.darkElv0),
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'Expired Date',
                  hintText: 'XX/XX',
                ),
                cvvCodeDecoration: InputDecoration(
                  hintStyle: const TextStyle(color: AppColors.darkElv1),
                  labelStyle: const TextStyle(color: AppColors.darkElv0),
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                cardHolderDecoration: InputDecoration(
                  hintStyle: const TextStyle(color: AppColors.darkElv1),
                  labelStyle: const TextStyle(color: AppColors.darkElv0),
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'Card Holder',
                ),
                onCreditCardModelChange: onCreditCardModelChange,
              ),
              SizedBox(
                height: 1.h,
              ),
              BlocConsumer<PurchaseCubit, PurchaseState>(
                listener: (context, state) {
                  if (state is PurchaseFailed) {
                    SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  if (state is PurchaseMachine) {
                    SnackBar snackBar =
                        const SnackBar(content: Text("Purchased successfully"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRouter.landingPage, (route) => false);
                  }
                  if (state is PurchaseUser) {
                    SnackBar snackBar =
                        const SnackBar(content: Text("Purchased successfully"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  if (state is PurchaseLoading) {
                    return const CircularProgressIndicator();
                  }
                  return AuthButton(
                    onPress: () => onValidPress(),
                    text: "Pay",
                  );
                },
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
