// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/servicwa/api_service.dart';
import 'package:google_clone/widgets/search_footer.dart';
import 'package:google_clone/widgets/search_header.dart';
import 'package:google_clone/widgets/search_resukt_component.dart';

import 'package:google_clone/widgets/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({Key? key, required this.searchQuery, required this.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //web header
              const SearchHeader(),
              //tabs for news images etc
               Padding(
                padding: EdgeInsets.only(left: size.width <= 768? 10 : 150.0),
                child:const SearchTabs(),
              ),
              const Divider(height: 0, thickness: 0.5),
              // search
              FutureBuilder<Map<String, dynamic>>(
                  future: ApiService().fetchData(
                      context: context, queryTerm: searchQuery, start: start),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // showing the time it took to fetch results
                          Container(
                            padding: EdgeInsets.only(
                                left: size.width <= 768 ? 10 : 150, top: 12),
                            child: Text(
                              "About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF70757a),
                              ),
                            ),
                          ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data?['items'].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: size.width <= 768? 20 : 150.0,
                                  top: 10,
                                ),
                                child: SearchResultComponent(
                                  desc: snapshot.data?['items'][index]['snippet'],
                                  link: snapshot.data?['items'][index]
                                      ['formattedUrl'],
                                  text: snapshot.data?['items'][index]['title'],
                                  linkToGo: snapshot.data?['items'][index]
                                      ['link'],
                                ),
                              );
                            })
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              // paginations buttons
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (start != 0)
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                searchQuery: searchQuery,
                                start: (int.parse(start) - 10).toString(),
                              ),
                            ),
                          );
                      },
                      child: Text(
                        '< Prev',
                        style: TextStyle(fontSize: 15, color: blueColor),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        if (start != 0)
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                searchQuery: searchQuery,
                                start: (int.parse(start) + 10).toString(),
                              ),
                            ),
                          );
                      },
                      child: Text(
                        'Next > ',
                        style: TextStyle(fontSize: 15, color: blueColor),
                      ),
                    ),
                  ],
                ),
              ),
      
              const SizedBox(
                width: 30,
              ),
              const SearchFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
