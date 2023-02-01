import 'package:app_movie/models/movie_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemMovieListWidget extends StatelessWidget{

  MovieModel movieModel;
  ItemMovieListWidget({ required this.movieModel});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return ClipRRect(
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: 10.0, horizontal: 14.0),
        width: double.infinity,
        height: height * 0.7,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://image.tmdb.org/t/p/w500${movieModel.posterPath}",
            ),
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movieModel.originalTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      movieModel.overview,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.thumb_up_alt,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              movieModel.voteCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            SvgPicture.asset(
                              height: 30.0,
                              "assets/icons/heart.svg",
                              color: Colors.redAccent,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Colors.white,
                            ),
                            FaIcon(
                                FontAwesomeIcons.flaskVial,
                                color: Colors.white,
                                size: 20.0
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              movieModel.releaseDate.toString().substring(0,10),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    shape: BoxShape.circle),
                child: Text(
                  movieModel.voteAverage.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
