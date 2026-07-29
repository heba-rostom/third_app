import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:project/features/home/cubit/cubit/home_cubit.dart";
import "package:project/features/home/ui/widgets/custom_button.dart";
import "package:project/features/home/ui/widgets/custom_text_form_field.dart";
import 'package:easy_localization/easy_localization.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Success".tr(),style:const TextStyle(
                      fontSize:16,
                      fontWeight:FontWeight.bold,
                      color:Colors.white,
                    )),
                    backgroundColor: Colors.grey,
                  ),
                );
              }else if (state is HomeError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message.tr(),style:TextStyle(
                      fontSize:16,
                      fontWeight:FontWeight.bold,
                      color:Colors.white,
                    )),
                    backgroundColor: Colors.grey,
                  ),
                );
              }
            },
            builder: (context, state) {
              var cubit = BlocProvider.of<HomeCubit>(context);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: cubit.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){
                         if(context.locale.languageCode=="en"){
                          context.setLocale(Locale("ar"));
                         }else{
                          context.setLocale(Locale("en"));
                         }
                        },icon:Icon(Icons.translate)),
                        Padding(
                          padding: const EdgeInsets.only(top: 120),
                          child: Text(
                            "Login".tr(),
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        CustomTextFormField(
                          controller: cubit.nameController,
                          tilte: "Name".tr(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your name'.tr();
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        CustomTextFormField(
                          controller: cubit.passwordController,
                          tilte: "Password".tr(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your password'.tr();
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        Text("Forget Password".tr()),
                        SizedBox(height: 100),
                        state is HomeLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomButton(
                              text: "Login".tr(),
                               onTap: () {
                               cubit.login();
                              },
                              ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
