import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/footer_text.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerColor,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                FooterText(title: 'about'),
                SizedBox(width: 10),
                FooterText(title: 'advertising'),
                SizedBox(width: 10),
                FooterText(title: 'bussiness'),
                SizedBox(width: 10),
                FooterText(title: 'how search works'),
                SizedBox(width: 10),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                FooterText(title: 'privacy'),
                SizedBox(width: 10),
                FooterText(title: 'terms'),
                SizedBox(width: 10),
                FooterText(title: 'setting'),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
