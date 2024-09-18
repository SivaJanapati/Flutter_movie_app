import 'package:flutter/material.dart';
import 'package:movie/description.dart';
import 'package:movie/utils/text.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Top Rated Movies',
            color: Colors.white,
            size: 18,
          ),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: (count, index) {
                  return InkWell(
                    onTap: (){
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: toprated[index]['title'],
                                  description: toprated[index]['overview'],
                                  bannerurl:
                                      'https://image.tmdb.org/t/p/w500' + toprated[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' + toprated[index]['poster_path'],
                                  vote: toprated[index]['vote_average'].toString(),
                                  launch_on: toprated[index]['release_date'])));
                    },
                    child: Container(
                      width: 140,
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Container(
                            height: 180,
                            width: 250,

                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                              ),fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            child: Center(child: modified_text(text: toprated[index]['title']!=null?toprated[index]['title']:'Loading', color: Colors.white, size: 14)),
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
