// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:laundry_middle_transportation/style/colors.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AppBarActionItems extends StatefulWidget {
//   const AppBarActionItems({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<AppBarActionItems> createState() => _AppBarActionItemsState();
// }

// class _AppBarActionItemsState extends State<AppBarActionItems> {
//   String? userAvatar;

//   @override
//   void initState() {
//     super.initState();
//     loadUserAvatar();
//   }

//   Future<void> loadUserAvatar() async {
//     final avatar = await getUserAvatar();
//     setState(() {
//       userAvatar = avatar;
//     });
//   }

//   Future<String?> getUserAvatar() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('user_avatar');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         IconButton(
//             icon: SvgPicture.asset(
//               'assets/calendar.svg',
//               width: 20,
//             ),
//             onPressed: () {}),
//         SizedBox(width: 10),
//         IconButton(
//             icon: SvgPicture.asset('assets/ring.svg', width: 20.0),
//             onPressed: () {}),
//         SizedBox(width: 15),
//         Row(children: [
//           CircleAvatar(
//             radius: 17,
//             backgroundImage: NetworkImage(
//               // 'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
//               'https://lh3.googleusercontent.com/a/ACg8ocI8-5uvzKBa1CCoteFxNvFZNsYsQ2oyDbgg4azf8T7slck=s96-c',
//             ),
//           ),
//           Icon(Icons.arrow_drop_down_outlined, color: AppColors.black)
//         ]),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_middle_transportation/style/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarActionItems extends StatefulWidget {
  const AppBarActionItems({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarActionItems> createState() => _AppBarActionItemsState();
}

class _AppBarActionItemsState extends State<AppBarActionItems> {
  String? userAvatar;

  @override
  void initState() {
    super.initState();
    loadUserAvatar();
  }

  Future<void> loadUserAvatar() async {
    final avatar = await getUserAvatar();
    setState(() {
      userAvatar = avatar;
    });
  }

  Future<String?> getUserAvatar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_avatar');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            icon: SvgPicture.asset(
              'assets/calendar.svg',
              width: 20,
            ),
            onPressed: () {}),
        SizedBox(width: 10),
        IconButton(
            icon: SvgPicture.asset('assets/ring.svg', width: 20.0),
            onPressed: () {}),
        SizedBox(width: 15),
        Row(children: [
          CircleAvatar(
            radius: 17,
            backgroundImage: userAvatar != null
                ? NetworkImage(userAvatar!) as ImageProvider
                : AssetImage(
                    'assets/placeholder_image.png'), // Use a placeholder image if userAvatar is not available
          ),
          Icon(Icons.arrow_drop_down_outlined, color: AppColors.black)
        ]),
      ],
    );
  }
}
