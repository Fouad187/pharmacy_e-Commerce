import 'package:e_commerce/Providers/Modal_hud.dart';
import 'package:e_commerce/Screens/User/User_home_screen.dart';
import 'package:e_commerce/Services/Auth_Services.dart';
import 'package:e_commerce/Widgets/auth_button.dart';
import 'package:e_commerce/Widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatelessWidget {
  static String id='RegistrationScreenID';

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmController=TextEditingController();
  Auth auth=Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Create Account' , style: TextStyle(color: Colors.black),),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalHud>(context).isChange,
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Let\'s Get Started' , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 25),),
                    SizedBox(height: 5,),
                    Text('Sign up to start your trip and get full access' , style: TextStyle(color: Colors.grey , fontSize: 18),),
                    SizedBox(height: 50,),
                    MyTextField(label: 'Name', picon: Icon(Icons.person), controller: nameController ,
                      validate: (String value){
                      if(value.isEmpty)
                        {
                          return 'Please enter your name';
                        }
                    },),
                    SizedBox(height: 20,),
                    MyTextField(label: 'Email', picon: Icon(Icons.email), controller: emailController,
                      validate: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please enter your email';
                        }
                      },),
                    SizedBox(height: 20,),
                    MyTextField(label: 'Password', picon: Icon(Icons.lock), security: true ,controller: passwordController ,
                      validate: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please enter your password';
                        }
                      },),
                    SizedBox(height: 20,),
                    MyTextField(label: 'Confirm Password', picon: Icon(Icons.lock),security: true, controller: confirmController,
                      validate: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please enter your confirm password';
                        }
                      },),
                    SizedBox(height: 30,),
                    Center(child: AuthButton(
                        tap: () async {
                          final instance = Provider.of<ModalHud>(context, listen: false);
                          instance.changeIsLoading(true);
                          if (_globalKey.currentState!.validate())
                          {
                            try {
                              await auth.createAccount(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                context: context,
                              );
                              instance.changeIsLoading(false);
                              Navigator.pushNamedAndRemoveUntil(context, UserHomeScreen.id , (route)=> false);
                            }
                            catch (e) {
                              instance.changeIsLoading(false);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email Must be Unique'),));
                            }
                          }
                        },
                        text: 'Create')),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?'),
                        SizedBox(width: 5,),
                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text('Login here' , style: TextStyle(fontWeight: FontWeight.w500 , color: Colors.blueAccent),)),
                      ],
                    ),
                  ],
                ),
              ),
          ),
        ),
      ),
    );
  }
}
