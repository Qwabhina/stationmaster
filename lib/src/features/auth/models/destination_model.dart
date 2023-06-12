import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stationmaster/src/utils/controllers/sm_controller.dart';

class DestinationModel {
  String? dId;
  String? dName;
  String? fare;
  String? tId;
  String? tName;
  String? tLong;
  String? tLat;
  String? tOpenhrs;
  List<Stms>? stms;

  DestinationModel({
    this.dId,
    this.dName,
    this.fare,
    this.tId,
    this.tName,
    this.tLong,
    this.tLat,
    this.tOpenhrs,
    this.stms,
  });

  DestinationModel.fromJson(Map<String, dynamic> json) {
    dId = json['d_id'];
    dName = json['d_name'];
    fare = json['fare'];
    tId = json['t_id'];
    tName = json['t_name'];
    tLong = json['t_long'];
    tLat = json['t_lat'];
    tOpenhrs = json['t_openhrs'];
    if (json['stms'] != null) {
      stms = <Stms>[];
      json['stms'].forEach((v) {
        stms!.add(Stms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['d_id'] = dId;
    data['d_name'] = dName;
    data['fare'] = fare;
    data['t_id'] = tId;
    data['t_name'] = tName;
    data['t_long'] = tLong;
    data['t_lat'] = tLat;
    data['t_openhrs'] = tOpenhrs;
    if (stms != null) {
      data['stms'] = stms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stms {
  String? sName;
  String? sPhone;

  Stms({this.sName, this.sPhone});

  Stms.fromJson(Map<String, dynamic> json) {
    sName = json['s_name'];
    sPhone = json['s_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['s_name'] = sName;
    data['s_phone'] = sPhone;
    return data;
  }
}

class DestinationsApi {
  // Fetch Search Results
  static Future<List<DestinationModel>> getSuggestions(String term) async {
    if (await SmController().checkUserConnection()) {
      if (term.isNotEmpty) {
        var response = await http.post(
          Uri.parse("http://station-master.rf.gd/process-search.php"),
          body: {'_search': 'Search', 'search-term': term},
        );

        if (response.statusCode == 200) {
          final List destinations = json.decode(response.body);

          return destinations
              .map((e) => DestinationModel.fromJson(e))
              .where((d) {
            return d.dName!.toLowerCase().contains(term.toLowerCase());
          }).toList();
        } else {
          return List.filled(
            1,
            DestinationModel(
              dName: "${response.statusCode}: ${response.body}",
              dId: "",
              fare: "",
              tName: "",
            ),
          );
          // throw "Search Results could not be found.";
        }
      } else {
        return List.empty();
        // return List.filled(
        //   1,
        //   DestinationModel(
        //     dName: "Start typing...",
        //     dId: "",
        //     fare: "",
        //     tName: "",
        //   ),
        // );
      }
    } else {
      return List.filled(
        1,
        DestinationModel(
          dName: "No internet connection detected.",
          dId: "",
          fare: "",
          tName: "",
        ),
      );
    }
  }
}
