import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/data.dart';

Future<List<MyWatchlist>> fetchWatchlist() async {
        var url = Uri.parse('https://lokeswara-pbp-tugas2.herokuapp.com/mywatchlist/json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object ToDo
        List<MyWatchlist> listWatchlist = [];
        for (var d in data) {
        if (d != null) {
            listWatchlist.add(MyWatchlist.fromJson(d));
        }
        }

        return listWatchlist;
    }