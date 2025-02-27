import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:safehome/screens/Landing.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text("This is a page")),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.green.shade700,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.blue,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: [
//           BottomNavigationBarItem(
//             icon: CircleAvatar(
//               backgroundColor: Colors.blue,
//               child: Icon(Icons.home, color: Colors.white),
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: CircleAvatar(
//               backgroundColor: Colors.blue,
//               child: Icon(Icons.chat, color: Colors.white),
//             ),
//             label: 'Chat',
//           ),
//           BottomNavigationBarItem(
//             icon: CircleAvatar(
//               backgroundColor: Colors.blue,
//               child: Icon(Icons.store, color: Colors.white),
//             ),
//             label: 'Near Shop',
//           ),
//           BottomNavigationBarItem(
//             icon: CircleAvatar(
//               backgroundColor: Colors.blue,
//               child: Icon(Icons.person, color: Colors.white),
//             ),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:safehome/screens/login.dart';
import 'package:safehome/screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreeen(),
      // home: LogIn(),
      routes: {
        // 'login': (context) => const LogIn(),
        // 'register': (context) => const Register(),
        // 'home': (context) => const HomeScreen(),
        // 'history': (context) => const showHistory(),
      },
    );
  }
}
