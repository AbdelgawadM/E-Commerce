// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:login_session/consts.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final user = FirebaseAuth.instance.currentUser;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           'My Profile',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             // Profile Picture and Info
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(
//                 // user?.photoURL ??
//                 "https://www.woolha.com/media/2020/03/flutter-circleavatar-radius.jpg",
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               // user?.displayName ??
//               "No Name",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               // user?.email ??
//               "No Email",
//               style: TextStyle(color: Colors.grey),
//             ),
//             const SizedBox(height: 20),

//             // Options
//             ProfileOption(
//               icon: CupertinoIcons.heart,
//               title: 'Favorites',
//               onTap: () {
//                 Navigator.pushNamed(context, '/favorites');
//               },
//             ),
//             ProfileOption(
//               icon: CupertinoIcons.cart,
//               title: 'My Orders',
//               onTap: () {
//                 Navigator.pushNamed(context, '/orders');
//               },
//             ),
//             ProfileOption(
//               icon: CupertinoIcons.settings,
//               title: 'Settings',
//               onTap: () {},
//             ),
//             ProfileOption(
//               icon: CupertinoIcons.info,
//               title: 'About App',
//               onTap: () {},
//             ),
//             ProfileOption(
//               icon: CupertinoIcons.square_arrow_right,
//               title: 'Logout',
//               onTap: () async {
//                 await FirebaseAuth.instance.signOut();
//                 Navigator.pushReplacementNamed(context, '/login');
//               },
//               color: Colors.red,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ProfileOption extends StatelessWidget {
//   const ProfileOption({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.onTap,
//     this.color = Colors.black,
//   });

//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withValues(alpha: 0.5),
//             blurRadius: 15,
//             // offset: const Offset(0, -1),
//           ),
//         ],
//       ),
//       child: Card(
//         color: Colors.white,
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         child: ListTile(
//           leading: Icon(icon, color: kPrimaryColor),
//           title: Text(title, style: TextStyle(color: color)),
//           trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
//           onTap: onTap,
//         ),
//       ),
//     );
//   }
// }
