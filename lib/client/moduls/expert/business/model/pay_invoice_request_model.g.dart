// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_invoice_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayInvoiceRequestModel _$PayInvoiceRequestModelFromJson(
        Map<String, dynamic> json) =>
    PayInvoiceRequestModel(
      invoiceId: json['invoiceId'] as String,
      paymentReference: json['paymentReference'] as String,
    );

Map<String, dynamic> _$PayInvoiceRequestModelToJson(
        PayInvoiceRequestModel instance) =>
    <String, dynamic>{
      'invoiceId': instance.invoiceId,
      'paymentReference': instance.paymentReference,
    };
