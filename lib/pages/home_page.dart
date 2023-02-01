import 'dart:convert';

import 'package:app_movie/models/movie_models.dart';
import 'package:app_movie/services/api_services.dart';
import 'package:app_movie/ui/widgets/item_movie_list_widget.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];
  List<MovieModel> moviesList = [];

  APIServices _apiServices = APIServices();

  @override
  void initState() {
    super.initState();
    getData()
    ;
  }

  getData()async{
    moviesList = await _apiServices.getMovies();
    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xff161823),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: moviesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemMovieListWidget(movieModel: moviesList[index],);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
