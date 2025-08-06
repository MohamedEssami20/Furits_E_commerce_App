import 'amount.dart';
import 'item_list.dart';

class PayPalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PayPalPaymentEntity({this.amount, this.description, this.itemList});

  

  Map<String, dynamic> toJson() => {
        'amount': amount?.toJson(),
        'description': description,
        'item_list': itemList?.toJson(),
      };


  factory PayPalPaymentEntity.fromEntity(PayPalPaymentEntity paymentEntity) {
    return PayPalPaymentEntity(
      amount: paymentEntity.amount,
      description: paymentEntity.description,
      itemList: paymentEntity.itemList,
    );
  }
}
