  // Consumer<ThemeProvider>(
  //             builder: (context, state, _) {
  //               return ProfileTiles(
  //                 icon: state.isDark
  //                     ? AppIcon().lightIcon.icon
  //                     : AppIcon().darkIcon.icon,

  //                 // darkTheme
  //                 // lightTheme
  //                 title: state.isDark
  //                     ? getTranslated('lightTheme', context)
  //                     : getTranslated('darkTheme', context),
  //                 trailing: Switch(
  //                   value: state.isDark,
  //                   onChanged: (value) {
  //                     state.toggleTheme(value);
  //                   },
  //                 ),
  //               );
  //             },
  //           ),


  //  ProfileTiles(
  //             icon: Icons.flag,
  //             onTap: () {
  //               showLanguageSelectionModal(context);
  //             },
  //             title: getTranslated('language', context),
  //             trailing: const Icon(
  //               Icons.arrow_forward_ios,
  //               size: 16,
  //             ),
  //           ),



  
// void showLanguageSelectionModal(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Consumer<LanguageProvider>(
//         builder: (context, value, child) {
//           return ThemeContainer(
//             height: 200,
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   'Change Language',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 ListTile(
//                   title: Text('🇺🇸  English'),
//                   onTap: () {
//                     value.onChangelanguage(
//                       locale: const Locale('en'),
//                     );
//                     Navigator.pop(context);
//                   },
//                 ),
//                 ListTile(
//                   title: Text('༂ Tibet'),
//                   onTap: () {
//                     value.onChangelanguage(
//                       locale: const Locale('hi'),
//                     );
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     },
//   );
// }





// class ProfileTiles extends StatelessWidget {
//   final String? title;
//   final IconData? icon;
//   final void Function()? onTap;
//   final Widget? trailing;

//   const ProfileTiles({
//     super.key,
//     this.trailing,
//     this.title,
//     this.onTap,
//     this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shadowColor: Colors.white,
//       child: ListTile(
//         onTap: onTap,
//         leading: Icon(icon!),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         dense: true,
//         trailing: trailing ??
//             Icon(
//               Icons.arrow_forward_ios,
//               size: 18,
//             ),
//         title: Text(
//           title!,
//           style: kBoldTextStyle(),
//         ),
//       ),
//     );
//   }
// }
