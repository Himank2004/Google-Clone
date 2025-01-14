import 'package:flutter/material.dart';
import 'package:google_clone/widgets/search_tab.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SearchTab(
            isActive: true,
            text: 'All',
            icon: Icons.search,
          ),
          SizedBox(width: 20,),
          SearchTab(
            text: 'Images',
            icon: Icons.image,
          ),
          SizedBox(width: 20,),
          SearchTab(
            text: 'map',
            icon: Icons.map,
          ),
          SizedBox(width: 20,),
          SearchTab(
            text: 'news',
            icon: Icons.article,
          ),
          SizedBox(width: 20,),
          SearchTab(
            text: 'shopping',
            icon: Icons.shop,
          ),
          SizedBox(width: 20,),
          SearchTab(
            text: 'More',
            icon: Icons.more,
          ),
          SizedBox(width: 20,),
        ],
      )
    );
  }
}