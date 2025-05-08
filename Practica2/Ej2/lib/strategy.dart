
//import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

//Clase abstracta
abstract class Strategy{

  String _token;
  String _url;

  Strategy(String tok, String mod)
      :_token = tok,
      _url = "https://api-inference.huggingface.co/models/$mod";

    Future<String> AlgorithmInterface(String text) async {
    try {
      // Carga el token desde el archivo
      _token = await rootBundle.loadString('$_token');

      final url_json = Uri.parse(_url);
      final headers = {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      };

      final body = jsonEncode({'inputs': text});

      final response = await http.post(url_json, headers: headers, body: body);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        // En algunos modelos como traductores, se espera una lista
        if (decoded is List && decoded.isNotEmpty && decoded[0]['translation_text'] != null) {
          return decoded[0]['translation_text'];
        }

        // Modelos como resumen o respuesta con 'generated_text'
        if (decoded is List && decoded.isNotEmpty && decoded[0]['generated_text'] != null) {
          return decoded[0]['generated_text'];
        }

        // Modelos como resumen o respuesta con 'summary_text'
        if (decoded is List && decoded.isNotEmpty && decoded[0]['summary_text'] != null) {
          return decoded[0]['summary_text'];
        }

        return "️ Formato de respuesta no reconocido:\n$decoded";
      }

      else if (response.statusCode == 503) {
        return "El modelo está cargando o no disponible. Intenta de nuevo en unos segundos.";
      }

      else if (response.statusCode == 401) {
        return " Token inválido o acceso no autorizado. Verifica tu archivo de token.";
      }

      else {
        return " Error al contactar con Hugging Face:\nCódigo: ${response.statusCode}\nCuerpo: ${response.body}";
      }

    } catch (e) {
      return " Error inesperado: $e";
    }
  }

}