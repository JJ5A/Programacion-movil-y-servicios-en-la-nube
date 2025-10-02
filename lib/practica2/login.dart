import 'package:flutter/material.dart';
import 'package:pmsn_2025_2/practica2/home_page.dart';

class LoginScreenp3 extends StatefulWidget {
  const LoginScreenp3({super.key});

  @override
  State<LoginScreenp3> createState() => _LoginScreenp3State();
}

class _LoginScreenp3State extends State<LoginScreenp3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👉 Register arriba derecha
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // 👉 Cuadro verde grande con "Sign In"
            Align(
              alignment: Alignment.centerRight,
              child: Transform.translate(
                offset: const Offset(
                  25,
                  0,
                ), //  se desborda 40px hacia la derecha
                child: Container(
                  height: 157,

                  margin: const EdgeInsets.only(left: 16),
                  decoration: const BoxDecoration(color: Color(0xFF00BC1E)),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 16),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 👉 Campos de texto redondeados
            TextField(
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 35),

            // 👉 Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // 👉 Botón Sign Up negro
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // 👉 Botón Google
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: Image.network(
                  "https://imagepng.org/wp-content/uploads/2019/08/google-icon-1.png",
                  width: 28,
                  height: 28,
                ),
                title: const Text(
                  "Sign In with Google",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black,
                ),
                onTap: () {},
              ),
            ),

            // 👉 Botón Facebook
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: Image.network(
                  "https://static.vecteezy.com/system/resources/previews/018/930/698/non_2x/facebook-logo-facebook-icon-transparent-free-png.png",
                  width: 32,
                  height: 32,
                ),
                title: const Text(
                  "Sign In with Facebook",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
