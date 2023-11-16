import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {

  // instancia de mensaje de una entidad
  final Message message;

  const MyMessageBubble({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {

    // igualar el tema de la clase principal
    final colors = Theme.of(context).colorScheme;

    return Column(

      // enviar mensajes a derecha o izquierda
      crossAxisAlignment: CrossAxisAlignment.end,

      children: [

        Container(

          decoration: BoxDecoration(

            color: colors.primary,
            // bordes para los cuadros de texto
            borderRadius: BorderRadius.circular(15)

          ),

          child: Padding(

            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          
          ),

        ),

        // separacion de las cajas de texto
        const SizedBox(height: 5)

      ],

    );
  }
}