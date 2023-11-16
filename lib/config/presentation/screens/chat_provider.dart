import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  // control del scroll
  final ScrollController chatScrollController = ScrollController();
  // instancia de la clase de peticion http para respuesta automatica
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  // ChangeNotifier puede notificar si hay un cambio (Observer?)
  List<Message> messageList = [

    //Message(text: 'Hola bb!', fromWho: FromWho.me),
    //Message(text: 'ya volviste de la pega?', fromWho: FromWho. hers)

  ];

  // metodo de envio de mensaje asincrono
  Future<void> sendMessage(String text) async {

    // en caso que el texto este vacio, devolver un return vacio
    if(text.isEmpty) return;

    // crear nuevo mensaje a traves del teclado
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    // validador de preguntas para respuestas automatizadas
    if(text.endsWith('?')){

      herReply();

    }

    // renderizar de nuevo el screen
    notifyListeners();
    // llamado de metodo para actuivar el scroll
    moveScrollToBottom();
  }

  // metodo para emular respuesta de persona
  Future<void> herReply() async {

    // obtencio de respuesta mediante peticion http
    final herMessage = await getYesNoAnswer.getAnswer();
    // anadir mensaje automatico a lista
    messageList.add(herMessage);
    // notificar al provider
    notifyListeners();
    // disparar scroll
    moveScrollToBottom();

  }

  // metodo para bajar el scroll animado
  Future<void> moveScrollToBottom() async {

    // future para dar la sensacion de procesamiento del texto
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
    );

  }

}