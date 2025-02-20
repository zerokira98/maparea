// import 'dart:io';

import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
// import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
part 'latlng_repo.g.dart';

class CoverArea extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get postalCode => integer()();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
  TextColumn get streetAddress => text().withLength(min: 6, max: 32)();
  IntColumn get regency => integer().references(Regency, #id)();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

class Regency extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get nid => integer()();
  IntColumn get parentNid => integer()();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
  TextColumn get regency => text()();
}

@DriftDatabase(tables: [CoverArea, Regency])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e])
      : super(
          e ??
              driftDatabase(
                name: 'map-app',
                native: const DriftNativeOptions(
                  databaseDirectory: getApplicationSupportDirectory,
                ),
                web: DriftWebOptions(
                  sqlite3Wasm: Uri.parse('sqlite3.wasm'),
                  driftWorker: Uri.parse('drift_worker.js'),
                  onResult: (result) {
                    if (result.missingFeatures.isNotEmpty) {
                      debugPrint(
                        'Using ${result.chosenImplementation} due to unsupported '
                        'browser features: ${result.missingFeatures}',
                      );
                    }
                  },
                ),
              ),
        );

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          try {
            var datas = await rootBundle
                .loadString('res/daftar-nama-daerah.csv')
                .then((value) {
              return const CsvToListConverter(eol: "\n").convert(value);
            });
            // print(datas);
            datas.removeAt(0);
            List<RegencyCompanion> generatedInsert = List.generate(
              datas.length,
              (index) {
                return RegencyCompanion.insert(
                    nid: int.parse(datas[index][0]),
                    parentNid: int.parse(datas[index][1]),
                    lat: double.parse(datas[index][5]),
                    lng: double.parse(datas[index][6]),
                    regency: (datas[index][2]));
              },
            );
            await batch(
              (batch) {
                batch.insertAll(regency, generatedInsert);
              },
            );
            var locMarkers = [
              CoverAreaCompanion.insert(
                  lat: -7.7691284398291245,
                  lng: 112.19649791645190,
                  postalCode: 64211,
                  streetAddress: 'jl. qweasdzxc',
                  regency: 42),
              CoverAreaCompanion.insert(
                  lat: -7.7651284398291243,
                  lng: 112.19649791645198,
                  postalCode: 64211,
                  streetAddress: 'jl. qweasdzxc',
                  regency: 42),
              CoverAreaCompanion.insert(
                  lat: -7.7691284398291245,
                  lng: 112.19249791645180,
                  postalCode: 64211,
                  streetAddress: 'jl. qweasdzxc',
                  regency: 42)
            ];
            await batch(
              (batch) {
                batch.insertAll(coverArea, locMarkers);
              },
            );
          } catch (e) {
            print(e);
          }
        },
      );

  Future<List<RegencyData>> getRegenciesData(String query) async {
    return await (select(regency)
          ..where(
            (tbl) => tbl.regency.contains(query),
          ))
        .get();
  }

  Future<List<CoverAreaData>> getCoverage() async {
    return select(coverArea).get();
  }

  Future insertCoverage(CoverAreaData data) async {
    return into(coverArea).insert(data);
  }

  Future getTable() async {
    return (allTables.first as $RegencyTable).all().get();
  }

  Future deletedb() async {
    // clear()
    await close();
    WasmDatabase.probe(
      databaseName: 'map-app',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    ).then(
      (value) async {
        value.existingDatabases.isNotEmpty
            ? await value.deleteDatabase(value.existingDatabases.last)
            : print('empty');
      },
    );
  }

  @override
  int get schemaVersion => 1;
}

// class AppRepository {
//   final AppDatabase database;
//   AppRepository({
//     required this.database
//   });
// }
