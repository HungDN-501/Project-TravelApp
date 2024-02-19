part of 'account_bloc.dart';

@immutable
sealed class AccountEvent {}

// Sự kiện lấy API
final class LoginFetched extends AccountEvent {
  final String email;
  final String password;

  LoginFetched({
    required this.email,
    required this.password,
  });
}

// Register Event
final class RegisterFetched extends AccountEvent {
  final String username;
  final String email;
  final int phone;
  final String password;

  RegisterFetched({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });
}

// Check email Event
final class CheckEmailFetched extends AccountEvent {
  final String email;

  CheckEmailFetched({
    required this.email,
  });
}

// Reset Pass Event
final class ResetPassFetched extends AccountEvent {
  final String newPass;
  final String email;

  ResetPassFetched({
    required this.newPass,
    required this.email,
  });
}
