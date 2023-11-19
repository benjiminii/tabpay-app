part of 'home_cubit.dart';

enum BottomSectionState {
  isScanning,
  isWaiting,
  isSuccessful,
  isFailed,
  isDefault
}

@freezed
class HomeState with _$HomeState {
  const HomeState._();
  const factory HomeState(
      {@Default(false) bool loading,
      @Default([]) List<TransactionModel> transactionList,
      @Default(UserModel()) UserModel userLogged,
      @Default(BottomSectionState.isDefault) BottomSectionState currentState,
      @Default(false) bool isNfcEnabled,
      @Default(false) bool isSecureNfcEnabled,
      @Default(false) bool isNfcHceSupported,
      @Default("") String platformVersion,
      @Default("") String waitingInvoiceId}) = _HomeState;

  factory HomeState.initial() => const HomeState();

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
