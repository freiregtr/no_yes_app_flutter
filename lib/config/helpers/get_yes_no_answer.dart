import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer{

  // instancia privada de peticion http por dio
  final _dio = Dio();

  Future<Message> getAnswer() async {

    // peticion http a YesNo
    final response = await _dio.get('https://yesno.wtf/api');

    // envio del object a model 
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    // respuesta de peticion http
    return yesNoModel.toMessageEntity();

  }

}