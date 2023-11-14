part of responses;

@freezed
class CreateInvoiceReq with _$CreateInvoiceReq {
  const factory CreateInvoiceReq({
    @Default('') String amount,
    @Default("") String phoneNumber,
  }) = _CreateInvoiceReq;

  factory CreateInvoiceReq.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceReqFromJson(json);
}

@freezed
class InvoiceDetailModel with _$InvoiceDetailModel {
  const factory InvoiceDetailModel({
    @Default('') String id,
    @Default("") String amount,
  }) = _InvoiceDetailModel;

  factory InvoiceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailModelFromJson(json);
}

@freezed
class PayInvoiceReq with _$PayInvoiceReq {
  const factory PayInvoiceReq({
    @Default('') String id,
    @Default("") String amount,
  }) = _PayInvoiceReq;

  factory PayInvoiceReq.fromJson(Map<String, dynamic> json) =>
      _$PayInvoiceReqFromJson(json);
}
