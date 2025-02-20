// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maparea/blocs/bloc/app_bloc.dart';
import 'package:maparea/repo/latlng_repo.dart';
import 'package:maparea/viewer.dart';
// import 'package:path/path.dart' as p;
// import 'package:vector_math/vector_math.dart' as v;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    home: RepositoryProvider(
      create: (context) => AppDatabase(),
      child: BlocProvider(
        create: (context) => AppBloc(),
        child: const Home(),
      ),
    ),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool editmode = false;
  @override
  Widget build(BuildContext context) {
    var appbloc = context.read<AppBloc>();
    return Scaffold(
      body: Row(
        children: [
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return Drawer(
                width: 240,
                child: Column(
                  children: [
                    Container(
                      height: 240,
                      color: Colors.blueGrey,
                      child: const Center(
                        child: Text(
                          'Aplikasi catat area cakupan',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    ListTile(
                      selected: state.editmode == false,
                      title: const Text('Viewer'),
                      onTap: () {
                        appbloc.add(UpdateAll(
                            newstate: appbloc.state.copyWith(editmode: false)));
                      },
                    ),
                    ListTile(
                      selected: state.editmode == true,
                      title: const Text('Editor'),
                      onTap: () async {
                        await RepositoryProvider.of<AppDatabase>(context)
                            .getCoverage()
                            .then(
                          (value) {
                            print(value);
                          },
                        );

                        // await RepositoryProvider.of<AppDatabase>(context)
                        //     .getTable()
                        //     .then(
                        //   (value) {
                        //     print(value[0]);
                        //   },
                        // );
                        // appbloc.add(UpdateAll(
                        //     newstate: appbloc.state.copyWith(editmode: true)));
                      },
                    ),
                    ListTile(
                      title: Text('deleteDb'),
                      onTap: () {
                        RepositoryProvider.of<AppDatabase>(context)
                            .deletedb()
                            .then(
                          (value) {
                            print('delete completed');
                          },
                        );
                      },
                    )
                  ],
                ),
              );
            },
          ),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return Expanded(
                  child: MapViewer(
                editmode: state.editmode,
              ));
            },
          ),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return AnimatedContainer(
                duration: Durations.long1,
                padding: const EdgeInsets.all(8),
                width: state.onCreatedPin ? 240 : 0,
                transform: Matrix4.identity()
                  ..translate(state.onCreatedPin ? 0 : -2),
                height: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(state.tappoint?.toString() ??
                                'LatLng : abc.321654,-d.321654'))
                      ],
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: TextField(
                                decoration:
                                    InputDecoration(labelText: 'Nama Jalan')))
                      ],
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: TextField(
                                decoration:
                                    InputDecoration(labelText: 'Kode Pos')))
                      ],
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: TextField(
                                decoration:
                                    InputDecoration(labelText: 'Kab/Kota')))
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // setState(() {
                          //   onCreatedPin = false;
                          //   editmode = false;
                          // });
                        },
                        child: const Text('Tambahkan'))
                  ],
                ),
              );
            },
          ),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              print(state.onCreatedPin);
              return AnimatedContainer(
                padding: const EdgeInsets.all(8),
                width: state.showVisibleLatLng ? 240 : 2,
                transform: Matrix4.identity()
                  ..translate(state.showVisibleLatLng ? 0 : -2),
                height: double.infinity,
                duration: Durations.medium4,
                child: const Column(
                  children: [
                    Text('ListViewVisibleLatLng'),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
