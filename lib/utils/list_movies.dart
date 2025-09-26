import 'package:flutter/material.dart';
import 'package:pmsn_2025_2/database/movies.dart';

class ListMovies extends StatefulWidget {
  const ListMovies({super.key});

  @override
  State<ListMovies> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies> {
  MoviesDatabase? moviesDB;

  @override
  void initState() {
    super.initState();
    moviesDB = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Películas"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/add").then((value) => setState(() {}));
            },
            icon: Icon(Icons.add_sharp),
          ),
        ],
      ),
      body: FutureBuilder(
        future: moviesDB!.SELECT(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          } else {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final data = snapshot.data as List;
              return data.isEmpty
                  ? Center(child: Text("No hay datos"))
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final objM = data[index];
                        return Container(
                          color: Colors.black,
                          child: Text(
                            objM.nameMovie ?? '',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    );
            } else {
              return Center(child: Text("No hay datos"));
            }
          }
        },
      ),
    );
  }
}
