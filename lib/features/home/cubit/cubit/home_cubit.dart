import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState!.validate()) {
      emit(HomeLoading());
      if (nameController.text == "heba" && passwordController.text == "123456") {
        emit(HomeSuccess());
      } else {
        emit(HomeError("error please try again"));
      }
    }
  }
   @override
   Future<void> close() {
    nameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
