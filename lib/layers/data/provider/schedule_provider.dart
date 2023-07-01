import 'dart:async';
import 'dart:convert';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/exceptions/api_exception.dart';
import 'package:easyflow/layers/data/model/schedule_model.dart';
import 'package:http/http.dart' as http;

class ScheduleProvider {
  // Método para obter todos os horários da API
  Future<List<ScheduleModel>> getAll() async {
    final url = ApiConfig.getUrl(ApiConfig.urlSchedules);
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      print(response.body);
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List)
            .map(
              (i) => ScheduleModel.fromMap(
                i,
              ),
            )
            .toList();
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }

// Método para obter um horário específico por ID da API
  Future<ScheduleModel> getById(int id) async {
    final url = ApiConfig.getUrl(ApiConfig.urlSchedules) + id.toString();
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      print(response.body);

      if (response.statusCode == 200) {
        return ScheduleModel.fromMap(jsonDecode(response.body));
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }

  // Método para adicionar um novo horário à API
  Future<int> add(ScheduleModel schedule) async {
    final url = ApiConfig.getUrl(ApiConfig.urlSchedules);
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(schedule.toMap()),
            headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      print(response.body);
      if (response.statusCode == 201) {
        return schedule.id;
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }

  // Método para editar um horário existente na API
  Future<void> edit(ScheduleModel schedule) async {
    final url = ApiConfig.getUrl(ApiConfig.urlSchedules) + schedule.id.toString();
    try {
      final response = await http.put(
       Uri.parse(url),body:
      jsonEncode(  schedule.toMap()),
        headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
      ).timeout(
        const Duration(seconds: 10),
      );
      print(response.body);
      if (response.statusCode != 200) {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }

  // Método para deletar um horário por ID da API
  Future<void> delete(int id) async {
    final url = ApiConfig.getUrl(ApiConfig.urlSchedules) + id.toString();
    try {
      final response = await http.delete(
       Uri.parse(url),
        headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
      ).timeout(
        const Duration(seconds: 10),
      );
      print(response.body);
      if (response.statusCode != 200) {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }
}
