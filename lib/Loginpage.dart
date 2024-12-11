// import 'package:clearvpn/Homedemo.dart';
// import 'package:clearvpn/main.dart';
// import 'package:flutter/material.dart';

// class Loginpage extends StatelessWidget {
//  final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        backgroundColor: Colors.black,
//     //   appBar: AppBar(
//     //  title: Text("home"),
//     //   backgroundColor: Color.fromARGB(115, 0, 101, 92),

//     // ),   
//     body: Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center, 
      
//       children: [
//         Text('Login', style: TextStyle(
//           fontSize: 34,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),),
//        SizedBox(
//         height: 21,
//        ),

//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email ID',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.email),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               SizedBox(height: 20),

//               TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.lock),
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(height: 20),




//       ElevatedButton(
//         onPressed: () {
//       Navigator.push(context,
//       MaterialPageRoute(
//         builder: (context) => Home(),
//       ));
//       }, 
      
//       style: ElevatedButton.styleFrom(
//               backgroundColor: const Color.fromARGB(255, 27, 246, 250), // Set button color to blue
//               foregroundColor: Colors.white, // Set text color to white for contrast
//               padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Adjust button padding
//             ),
      
//       child: Text('Login'),
//       )
//       ],
//     )
//     )
//     );


//   }



// }


import 'package:clearvpn/Homedemo.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color.fromARGB(255, 24, 237, 198),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email ID',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (email.isNotEmpty && password.isNotEmpty) {
                   
                    print('Email: $email');
                    print('Password: $password');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  Home(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter both email and password'),
                      ),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


