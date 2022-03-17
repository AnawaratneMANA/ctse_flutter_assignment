import 'package:ctse_assignment_1/components/movie/moviecard/long_library_movie_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import '../styles.dart';
import '../util/crud_model.dart';
import 'movie_multi_select.dart';

class LibraryHome extends StatefulWidget {
  final String name;
  final Stream<List<Movie>>? movies;
  const LibraryHome({Key? key, required this.name, this.movies}) : super(key: key);

  @override
  State<LibraryHome> createState() => _LibraryHomeState();
}

class _LibraryHomeState extends State<LibraryHome> {
  @override
  Widget build(BuildContext context) {
    Stream<List<Movie>> listMovies = Provider.of<CrudModel>(context).getListOfMoviesShort;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "All Libraries",
                          style: Styles.textSectionHeader,
                        ),
                        Text(
                          "Custom Libraries to Manage Favorite Movies",
                          style: Styles.textSectionSubBody,
                        ),
                      ],
                    ),
                  ),
                  FloatingActionButton.small(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  MovieMultiSelect()),
                    );
                  }, child: const Icon(Icons.add), backgroundColor: Colors.teal,),
                ],
              ),


              const SizedBox(
                height: 10,
              ),
              Flexible(
                flex: 9,
                child: SafeArea(
                  child: StreamBuilder<List<Movie>>(
                      stream: listMovies,
                      builder: (context, snapshot) {
                        if(snapshot.hasError){
                          return Text("Error");
                        } else if(snapshot.hasData){
                          final libraries = snapshot.data!;
                          return ListView.builder(
                            itemCount: 5,
                            itemBuilder: (BuildContext context, index){
                              return LongLibraryMovieCard(index: index);
                            },
                          );
                        } else {
                          return Center(child: CircularProgressIndicator(),);
                        }
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}