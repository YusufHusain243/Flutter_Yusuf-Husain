import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://imsea.herokuapp.com/api/1?q=natural%20tourism'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final List results;

  const Album({
    required this.results,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      results: json["results"],
    );
  }
}
