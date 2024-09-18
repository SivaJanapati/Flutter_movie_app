import 'package:flutter/material.dart';
import 'package:movie/description.dart';
import 'package:movie/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'TV Shows',
            color: Colors.white,
            size: 18,
          ),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (count, index) {
                  return InkWell(
                    onTap: (){
                       
                    },
                    child: Container(
                      width: 250,
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path']
                              ),fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            child: modified_text(text: tv[index]['original_name'], color: Colors.white, size: 14),
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
