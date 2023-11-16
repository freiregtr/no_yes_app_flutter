import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/presentation/screens/chat_provider.dart';
import 'package:yes_no_app/config/presentation/widget/chat/her_message_bubble.dart';
import 'package:yes_no_app/config/presentation/widget/chat/my_message_bubble.dart';
import 'package:yes_no_app/config/presentation/widget/shared/message_field_box.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        leading: const Padding(

          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(

            backgroundImage: NetworkImage('https://pm1.aminoapps.com/8769/03eb8653ec8dfd806574a773c60fad51e6099947r1-736-736v2_128.jpg'),

          ),

        ),

        title: const Text('holi'),
        centerTitle: false,
      ),

      // body
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    // referencia al provider
    final chatProvider = context.watch<ChatProvider>();

    // SafeArea permite trabajar con el espacio seguro del boton home
    return SafeArea(
      child: Padding(

        // padding permite manipular los bordes
        padding: const EdgeInsets.symmetric( horizontal: 10 ),

        child: Column(
          
          children: [
          
            Expanded(child: ListView.builder(

              // controller del scroll
              controller: chatProvider.chatScrollController,

              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.hers)
                ? HerMessageBubble( message: message)
                : MyMessageBubble(message: message);                

              },
            )),  

            // caja de texto de mensajes
            MessageFieldBox(

              onValue: (value) => chatProvider.sendMessage(value),

            )     

          ],
        ),
      ),
    );
  }
}