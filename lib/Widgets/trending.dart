import 'package:flutter/material.dart';
import 'package:movie/description.dart';
import 'package:movie/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Trending Movies',
            color: Colors.white,
            size: 18,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (count, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: trending[index]['title'],
                                  description: trending[index]['overview'],
                                  bannerurl:
                                      'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path'],
                                  vote: trending[index]['vote_average'].toString(),
                                  launch_on: trending[index]['release_date'])));
                    },
                    child: Container(
                      width: 140,
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path']),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Center(
                                child: modified_text(
                                    text: trending[index]['title'] != null
                                        ? trending[index]['title']
                                        : 'Loading',
                                    color: Colors.white,
                                    size: 14)),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
