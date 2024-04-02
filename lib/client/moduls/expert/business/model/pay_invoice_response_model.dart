import 'package:json_annotation/json_annotation.dart';

part 'pay_invoice_response_model.g.dart';

@JsonSerializable()
class PayInvoiceResponseModel {
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "payment")
  final String paymentId;
  @JsonKey(name: "amount")
  final int amount;
  @JsonKey(name: "user")
  final String userId;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "id")
  final String id;

  const PayInvoiceResponseModel({
    required this.status,
    required this.paymentId,
    required this.amount,
    required this.userId,
    required this.type,
    required this.id,
  });

  factory PayInvoiceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PayInvoiceResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$PayInvoiceResponseModelToJson(this);
}
