import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/screens/log_in_screen.dart';
import 'package:frontbooks/utils/colors.dart';
import 'nav_options.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // automaticallyImplyLeading: false,
      backgroundColor: AppColors.primaryColor,
      iconTheme: const IconThemeData(
          color: kIsWeb ? AppColors.whiteColor : Color(0xffF2F8F8)),
      centerTitle: false,
      title: MediaQuery.of(context).size.width < 600
          ? const Text("Préstamo de Libros",
              style: TextStyle(color: Color(0XFFF2F8F8)))
          : const NavOptions(),

      actions: (MediaQuery.of(context).size.width >= 600)
          ? [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInScreen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  child: const Text(
                    "Cerrar Sesión",
                    style: TextStyle(color: AppColors.whiteColor),
                  ))
            ]
          : [],
    );
  }
}
