import 'package:json_annotation/json_annotation.dart';

part 'pay_invoice_request_model.g.dart';

@JsonSerializable()
class PayInvoiceRequestModel {
  @JsonKey(name: "invoiceId")
  final String invoiceId;
  @JsonKey(name: "paymentReference")
  final String paymentReference;

  const PayInvoiceRequestModel({
    required this.invoiceId,
    required this.paymentReference,
  });

  factory PayInvoiceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PayInvoiceRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$PayInvoiceRequestModelToJson(this);
}
