import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:project/features/home/cubit/cubit/home_cubit.dart";
import "package:project/features/home/ui/widgets/custom_button.dart";
import "package:project/features/home/ui/widgets/custom_text_form_field.dart";

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
                  const SnackBar(
                    content: Text('Success',style:TextStyle(
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
                    content: Text(state.message,style:TextStyle(
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
                        Padding(
                          padding: const EdgeInsets.only(top: 120),
                          child: Text(
                            "login",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        CustomTextFormField(
                          controller: cubit.nameController,
                          tilte: "Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        CustomTextFormField(
                          controller: cubit.passwordController,
                          tilte: "Password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        Text("Forget Password ?"),
                        SizedBox(height: 100),
                        state is HomeLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomButton(
                              text: "login",
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
