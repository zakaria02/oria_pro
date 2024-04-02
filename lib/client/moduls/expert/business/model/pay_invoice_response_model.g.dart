// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_invoice_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayInvoiceResponseModel _$PayInvoiceResponseModelFromJson(
        Map<String, dynamic> json) =>
    PayInvoiceResponseModel(
      status: json['status'] as String,
      paymentId: json['payment'] as String,
      amount: json['amount'] as int,
      userId: json['user'] as String,
      type: json['type'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$PayInvoiceResponseModelToJson(
        PayInvoiceResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payment': instance.paymentId,
      'amount': instance.amount,
      'user': instance.userId,
      'type': instance.type,
      'id': instance.id,
    };
