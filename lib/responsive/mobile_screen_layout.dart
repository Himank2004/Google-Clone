import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/search.dart';
import 'package:google_clone/widgets/mobile/MobileFooter.dart';
import 'package:google_clone/widgets/translation_button.dart';
import 'package:google_clone/widgets/web/WebFooter.dart';
import 'package:google_clone/widgets/web/search_buttons.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        title: SizedBox(
          width: size.width *0.34,
          child: const DefaultTabController(
            length: 2,
            child: TabBar(
              tabs: [
                Tab(
                  text: 'all',
                ),
                Tab(
                  text: 'images',
                ),
              ],
            ),
          ),
        ),
        actions: [
          const SizedBox(width: 10),
          IconButton(
              icon: SvgPicture.asset('assets/images/more-apps.svg',
                  color: primaryColor),
              onPressed: () {}),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10).copyWith(
              right: 10,
            ),
            child: MaterialButton(
              onPressed: () {},
              color: const Color(0xff1A73EB),
              child: const Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.25),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // since children of column are not supposed to be 'spaced between'
                  Column(
                    children: [
                      Search(),
                      SizedBox(height: 20),
                      SearchButtons(),
                      SizedBox(height: 20),
                      TranslationButton(),
                    ],
                  ),
                  const MobileFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
