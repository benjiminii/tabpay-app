part of responses;

@freezed
class VerifyOtpReq with _$VerifyOtpReq {
  const factory VerifyOtpReq({
    @Default('') String phone,
    @Default("") String otp,
  }) = _VerifyOtpReq;

  factory VerifyOtpReq.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpReqFromJson(json);
}

@freezed
class CreatePinReq with _$CreatePinReq {
  const factory CreatePinReq({
    @Default('') String phone,
    @Default("") String pin,
  }) = _CreatePinReq;

  factory CreatePinReq.fromJson(Map<String, dynamic> json) =>
      _$CreatePinReqFromJson(json);
}
