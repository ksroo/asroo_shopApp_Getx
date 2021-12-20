// To parse this JSON data, do
//
//     final getAllCategoryModel = getAllCategoryModelFromJson(jsonString);

import 'dart:convert';

List<String> getAllCategoryModelFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String getAllCategoryModelToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
