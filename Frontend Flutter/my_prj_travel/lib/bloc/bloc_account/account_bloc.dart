import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prj_travel/data/data_account/repository/account_repository.dart';
import 'package:my_prj_travel/models/account_model.dart';
import 'package:my_prj_travel/models/result_model.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository accountRepository;

  // Constructor
  AccountBloc(this.accountRepository) : super(AccountInitial()) {
    on<LoginFetched>(_getCurrentLogin);
    on<RegisterFetched>(_getCurrentRegister);
    on<CheckEmailFetched>(_getCurrentChekEmail);
    on<ResetPassFetched>(_getCurrentResetPass);
  }

  void _getCurrentLogin(LoginFetched event, Emitter<AccountState> emit) async {
    // Load
    emit(AccountLoading());

    try {
      // Láy thông tin đối tượng LoginRepository
      final login =
          await accountRepository.getCurrentLogin(event.email, event.password);

      // Lấy thông tin thành công
      emit(LoginSuccess(loginModel: login));
    } catch (e) {
      // Lấy thông tin lỗi
      emit(AccountFailure(e.toString()));
    }
  }

  void _getCurrentRegister(
      RegisterFetched event, Emitter<AccountState> emit) async {
    // Load
    emit(AccountLoading());

    try {
      // Láy thông tin đối tượng LoginRepository
      final result = await accountRepository.getCurrentRegister(
          event.username, event.email, event.phone, event.password);

      // Lấy thông tin thành công
      emit(RegisterSuccess(resultModel: result));
    } catch (e) {
      // Lấy thông tin lỗi
      print("Error register : " + e.toString());
      emit(AccountFailure(e.toString()));
    }
  }

  void _getCurrentChekEmail(
      CheckEmailFetched event, Emitter<AccountState> emit) async {
    // Load
    emit(AccountLoading());

    try {
      // Láy thông tin đối tượng LoginRepository
      final result = await accountRepository.getCurrentCheckMail(event.email);

      // Lấy thông tin thành công
      emit(CheckEmailSuccess(resultModel: result));
    } catch (e) {
      // Lấy thông tin lỗi
      print("Error check email : " + e.toString());
      emit(AccountFailure(e.toString()));
    }
  }

  void _getCurrentResetPass(
      ResetPassFetched event, Emitter<AccountState> emit) async {
    // Load
    emit(AccountLoading());

    try {
      final result = await accountRepository.getCurrentResetPass(
          event.email, event.newPass);

      // Lấy thông tin thành công
      emit(ResetPassSuccess(resultModel: result));
    } catch (e) {
      // Lấy thông tin lỗi
      print("Error check email : " + e.toString());
      emit(AccountFailure(e.toString()));
    }
  }
}
