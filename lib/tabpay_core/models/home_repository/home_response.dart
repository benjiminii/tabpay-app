part of responses;

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    @Default(0) int id,
    @Default('') String createdDate,
    @Default(0) int transactionAmount,
    @Default(0) int remainingBalance,
    @Default(false) bool isIncome,
    @Default("") String description,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @Default(0) int id,
    @Default('') String createdDate,
    @Default(0) int remainingBalance,
    @Default('') String accountNo,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
