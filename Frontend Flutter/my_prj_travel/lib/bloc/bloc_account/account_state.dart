part of 'account_bloc.dart';

@immutable
sealed class AccountState {}

// Trạng thái khởi tạo
final class AccountInitial extends AccountState {}

// Login thành công
final class LoginSuccess extends AccountState {
  final AccInfoModel loginModel;

  LoginSuccess({required this.loginModel});
}

// Register thành công
final class RegisterSuccess extends AccountState {
  final ResultModel resultModel;

  RegisterSuccess({required this.resultModel});
}

// Check Email thành công
final class CheckEmailSuccess extends AccountState {
  final ResultModel resultModel;

  CheckEmailSuccess({required this.resultModel});
}

// Reset Pass thành công
final class ResetPassSuccess extends AccountState {
  final ResultModel resultModel;

  ResetPassSuccess({required this.resultModel});
}

// Trạng thái thất bại
final class AccountFailure extends AccountState {
  final String error;

  AccountFailure(this.error);
}

// Trạng thái load
final class AccountLoading extends AccountState {}
