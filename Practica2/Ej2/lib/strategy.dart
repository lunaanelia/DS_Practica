
//import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

//Clase abstracta
abstract class Strategy{

  String token;
  String url;

  Strategy(String tok, String mod)
      :token = tok,
      url = "https://api-inference.huggingface.co/models/$mod";


  Future<String> AlgorithmInterface(String text ) async {

  token = await rootBundle.loadString('assets/$token');

    String resultado;

    final url_json = Uri.parse(url); //Convierte un string a Uri
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json', //indica que está en formato json
    };

    final body = jsonEncode({'inputs': text});  //Argumentos que se le pasan al modelo

    final response = await http.post(url_json, headers: headers, body: body);

    if (response.statusCode == 200) {   //Respuesta exitosa
      resultado = jsonDecode(response.body);  //Decodifica la respuesta (de json a String)
    } else {  //Error
      resultado = "Error:  ";
          //"${response.statusCode}\n${response.body}";
    }

    return resultado;
  }

}