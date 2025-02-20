import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:maparea/blocs/bloc/app_bloc.dart';
import 'package:maparea/repo/latlng_repo.dart';

class MapViewer extends StatefulWidget {
  final bool editmode;
  MapViewer({super.key, this.editmode = false});

  @override
  State<MapViewer> createState() => _MapViewerState();
}

class _MapViewerState extends State<MapViewer> {
  final MapController mc = MapController();
  double zoom = 12.0;
  bool firstbuild = true;
  List<List<dynamic>> rowsAsListOfValues = [];
  LatLng? mylocation;
  // LatLng? tappoint;
  List<LatLng> visibleMarker = [];
  List<Marker> visibleMarkerMarker = [];

  static const _distance = Distance();

  @override
  void initState() {
    rootBundle.loadString('res/daftar-nama-daerah.csv').then(
      (value) {
        // return ;
        setState(() {
          rowsAsListOfValues =
              const CsvToListConverter(eol: "\n").convert(value);
        });
      },
    );
    RepositoryProvider.of<AppDatabase>(context).getCoverage().then(
      (value) {
        mc.mapEventStream
            .listen((listen) => mcListener(listen, locMarkers: value));
      },
    );
    Future.delayed(
      Duration(seconds: 5),
      () {
        mc.move(mc.camera.center, zoom - 1);
      },
    );
    super.initState();
  }

  mcListener(MapEvent event, {required List<CoverAreaData> locMarkers}) {
    var locMarkersLatLng = locMarkers
        .map(
          (e) => LatLng(e.lat, e.lng),
        )
        .toList();
    setState(() {
      zoom = event.camera.zoom;
      if (event.camera.zoom > 15) {
        visibleMarker = locMarkersLatLng
            .where((element) => event.camera.visibleBounds.contains(element))
            .toList();
      } else if (event.camera.zoom >= 12) {
        //group marker plz //nvm??
        visibleMarker = locMarkersLatLng
            .where((element) => event.camera.visibleBounds.contains(element))
            .toList();
      }
      visibleMarkerMarker = markersBuilder(context);
    });

    visibleMarkerMarker = markersBuilder(context);
  }

  List<Marker> markersBuilder(BuildContext context2) {
    var radius = 150.0;
    List<Marker> telo = [];

    for (var i = 0; i < visibleMarker.length; i++) {
      if (firstbuild == false) {
        var camera = mc.camera;
        final center = camera.getOffsetFromOrigin(visibleMarker[i]);
        radius = (center -
                camera.getOffsetFromOrigin(
                    _distance.offset(visibleMarker[i], 150, 180)))
            .distance;
      }

      telo.add(
        Marker(
            height: radius * 2,
            width: radius * 2,
            key: Key(radius.toString() + i.toString()),
            point: visibleMarker[i],
            child: InkWell(
              onTap: () {
                // print('tapped');
                ScaffoldMessenger.of(context2)
                  ..clearSnackBars()
                  ..showSnackBar(
                      SnackBar(content: Text('Clicked! ${visibleMarker[i]}')));
              },
              child: Container(
                height: radius * 2,
                width: radius * 2,
                decoration: BoxDecoration(
                    color: Colors.blue.withAlpha(100),
                    borderRadius: BorderRadius.circular(radius)),
                child: SizedBox(
                  height: radius * 2,
                  width: radius * 2,
                ),
              ),
            )),
      );
    }
    firstbuild = false;
    return telo;
  }

  @override
  Widget build(BuildContext context) {
    var appbloc = context.watch<AppBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.editmode ? 'Telo Editor' : 'Telo Viewer'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mc,
            options: MapOptions(
              onTap: widget.editmode
                  ? (tapPosition, point) {
                      appbloc.add(UpdateAll(
                          newstate: appbloc.state.copyWith(
                        onCreatedPin: false,
                        tappoint: () => null,
                      )));
                    }
                  : null,
              onLongPress: widget.editmode
                  ? (tapPosition, point) {
                      appbloc.add(UpdateAll(
                          newstate: appbloc.state.copyWith(
                              onCreatedPin: true, tappoint: () => point)));
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('tapped')));
                    }
                  : null,
              minZoom: 12,
              initialCenter:
                  const LatLng(-7.7691284398291245, 112.19649791645196),
              initialZoom: 16,
            ),
            children: [
              TileLayer(
                  tileProvider: CancellableNetworkTileProvider(),
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app'),
              MarkerLayer(markers: [
                if (mylocation != null)
                  Marker(
                      point: mylocation!,
                      child: const Icon(
                        Icons.gps_fixed,
                        color: Colors.blue,
                      ))
              ]),
              BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return state.tappoint != null
                      ? MarkerLayer(markers: [
                          Marker(
                              point: state.tappoint!,
                              child: const Icon(Icons.location_on,
                                  color: Colors.red))
                        ])
                      : SizedBox();
                },
              ),
              MarkerClusterLayerWidget(
                  options: MarkerClusterLayerOptions(
                      maxClusterRadius: 50,
                      size: const Size(45, 45),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(50),
                      showPolygon: true,
                      maxZoom: 15,
                      markers: visibleMarkerMarker,
                      builder: (context, markers) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withAlpha(120)),
                            child: Center(
                              child: Text(
                                markers.length.toString() + ' ',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ))),
            ],
          ),
          Positioned(
              top: 10,
              left: 10,
              child: ElevatedButton(
                  onPressed: () {
                    mc.rotate(0);
                  },
                  child: const Icon(Icons.north))),
          Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Card(
                child: Autocomplete<RegencyData>(
                  displayStringForOption: (option) => option.regency,
                  optionsViewOpenDirection: OptionsViewOpenDirection.up,
                  onSelected: (option) {
                    print(option.id);
                    mc.move(LatLng(option.lat, option.lng), 10);
                  },
                  optionsBuilder: (textEditingValue) async {
                    if (textEditingValue.text == '') {
                      return const Iterable<RegencyData>.empty();
                    }
                    return RepositoryProvider.of<AppDatabase>(context)
                        .getRegenciesData(textEditingValue.text.toLowerCase())
                        .then(
                          (value) => value,
                        );
                  },
                  optionsViewBuilder: (context, onSelected, options) =>
                      ListView.builder(
                          itemCount: options.length,
                          shrinkWrap: true,
                          reverse: true,
                          itemBuilder: (context, index) => Material(
                                child: ListTile(
                                  onTap: () {
                                    // var bloc =  BlocProvider.of<AppBloc>(context);
                                    //  bloc.add(UpdateAll(newstate: bloc.state.copyWith(tappoint: () => ,)))
                                    onSelected(options.elementAt(index));
                                  },
                                  title: Text(options.elementAt(index).regency),
                                ),
                              )),
                ),
              )),
          Positioned(
              bottom: 50,
              right: 10,
              child: ElevatedButton(
                  onPressed: () => Location().getLocation().then((value) {
                        setState(() {
                          mylocation =
                              LatLng(value.latitude!, value.longitude!);
                        });

                        mc.move(mylocation!, zoom);
                        if (visibleMarker.isNotEmpty) {
                          bool a = visibleMarker.any((element) =>
                              const Distance().distance(element, mylocation!) <
                              150);
                          if (a) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Anda dalam jangkauan >_<')));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Anda diluar jangkauan T_T\nAkan ditetapkan biaya perpanjangan kabel')));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'Anda diluar jangkauan T_T\nAkan ditetapkan biaya perpanjangan kabel')));
                        }
                      }),
                  child: const Icon(Icons.location_on))),
        ],
      ),
    );
  }
}
