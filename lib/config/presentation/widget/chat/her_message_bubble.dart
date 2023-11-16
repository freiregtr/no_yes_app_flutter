import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {

  // objeto de respuesta hers
  final Message message;

  const HerMessageBubble({

    super.key, 
    required this.message

  });

  @override
  Widget build(BuildContext context) {

    // igualar el tema de la clase principal
    final colors = Theme.of(context).colorScheme;

    return Column(

      // enviar mensajes a derecha o izquierda
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Container(

          decoration: BoxDecoration(

            color: colors.secondary,
            // bordes para los cuadros de texto
            borderRadius: BorderRadius.circular(20)

          ),

          child: Padding(

            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,  
              style: const TextStyle(color: Colors.white)
            ),
          
          ),

        ),

        // separacion de las cajas de texto
        const SizedBox(height: 5),

        // imagen
        _ImageBubble( message.imageUrl! ),

        const SizedBox(height: 10,)

      ],

    );
  }
}

class _ImageBubble extends StatelessWidget {

  // string con url de yesno app
  final String imageUrl;

  const _ImageBubble( this.imageUrl );
  
  @override
  Widget build(BuildContext context) {

    // variable que determina el tamanio global del telefono
    final size = MediaQuery.of(context).size;
    
    return ClipRRect(

      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        
        imageUrl, 
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: ( context, child, loadingProgress ) {
          
          if( loadingProgress == null ){
            
            return child;

          }

          return Container(
          
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5 ),
            child: const Text('esta enviando un mensaje'),

          );

        },


      
      ),

    );

  }
}