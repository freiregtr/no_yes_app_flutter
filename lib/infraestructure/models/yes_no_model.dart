import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({

        // constructor
        required this.answer,
        required this.forced,
        required this.image,

    });

    // metodo para construir objeto desde json (factory)
    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    // metodo para poder personalizar las respuestas 
    Message toMessageEntity() => Message(

      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.hers,
      imageUrl: image

    );
}

