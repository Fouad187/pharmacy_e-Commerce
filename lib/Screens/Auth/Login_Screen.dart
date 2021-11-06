import 'package:e_commerce/Providers/Modal_hud.dart';
import 'package:e_commerce/Screens/Auth/Registartion_Screen.dart';
import 'package:e_commerce/Services/Auth_Services.dart';
import 'package:e_commerce/Widgets/auth_button.dart';
import 'package:e_commerce/Widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static String id='LoginScreenID';

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  Auth auth=Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalHud>(context).isChange,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Image(
                        image: AssetImage(
                          'assets/images/login.png',
                        ),
                        height: 200.0,
                        width: 200.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(child: Text('Welcome' , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 25),)),
                  SizedBox(height: 5,),
                  Center(child: Text('Sign in to enjoy your shopping trip' , style: TextStyle(color: Colors.grey , fontSize: 18),),),
                  SizedBox(height: 40,),
                  MyTextField(label: 'Email', picon: Icon(Icons.email) , controller: emailController,
                    validate: (value){
                      if(value.isEmpty)
                      {
                        return 'Please enter your email';
                      }
                    },),
                  SizedBox(height: 20,),
                  MyTextField(label: 'Password', picon: Icon(Icons.lock), controller: passwordController ,security: true,
                    validate: (value){
                      if(value.isEmpty)
                      {
                        return 'Please enter your password';
                      }
                    },),
                  SizedBox(height: 30,),
                  Center(
                    child: AuthButton(
                      text: 'LOG IN',
                      tap: () async {
                        final instance = Provider.of<ModalHud>(context, listen: false);
                        instance.changeIsLoading(true);
                        if (_globalKey.currentState!.validate()) {
                          _globalKey.currentState!.save();
                          try
                          {
                            await auth.signIn(email: emailController.text , password: passwordController.text , context: context);
                          }
                          catch (e) {
                            instance.changeIsLoading(false);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong Email or Password')));
                          }
                        }

                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      SizedBox(width: 5,),
                      InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, RegistrationScreen.id);
                          },
                          child: Text('Sing Up' , style: TextStyle(fontWeight: FontWeight.w500 , color: Colors.blueAccent),)),
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
