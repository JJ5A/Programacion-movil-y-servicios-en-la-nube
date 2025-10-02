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
              Navigator.pushNamed(
                context,
                "/add",
              ).then((value) => setState(() {}));
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
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final objM = data[index];
                        return Container(
                          height: 100,
                          color: Colors.black,
                          child: Column(
                            children: [
                              Text(objM.nameMovie!),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.edit),
                                  ),
                                  //Expanded(child: Container()),
                                  IconButton(
                                    onPressed: () async {
                                      return showDialog(
                                        context: context,
                                        builder: (context) =>
                                            _buildAlertDialog(),
                                      );
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ],
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

  Widget _buildAlertDialog() {
    return AlertDialog(
      title: Text("Eliminar"),
      content: Text("¿Está seguro de eliminar este registro?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancelar"),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Aceptar")),
      ],
    );
  }
}
