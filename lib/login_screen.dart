import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:pmsn_2025_2/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtUserController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();
  bool isValidating = false;

  @override
  Widget build(BuildContext context) {

    final txtUser=TextField(
      controller: txtUserController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Correo electronico',

  
      ),
    );
    final txtPassword=TextField(
      controller: txtPasswordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Contraseña',

      ),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top:200 ,
              child: Text('Hola',style: TextStyle(color: Colors.white,fontSize: 35,fontFamily: 'MotionPicture')
            ,)
            ),
            Positioned(
              bottom: 80,
              child:Container(
                padding: EdgeInsets.symmetric(horizontal: 80),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.27,
                decoration: BoxDecoration(
                       color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    txtUser,
                    txtPassword,
                    IconButton(onPressed: () {
                      isValidating = true;
                      setState(() {});
                      Future.delayed(Duration(milliseconds: 2000)).then((value) =>
                      Navigator.pushNamed(context, "/home"));

                    },
                    icon: Icon(Icons.login,size:40,)
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 300,
              child: isValidating == true
              ? Lottie.asset('loading2.json',height:200, width:200)
              : Container(),
            )
          ],
        ),
      ),
    );
  }
}