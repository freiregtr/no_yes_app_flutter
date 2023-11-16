import 'package:flutter/material.dart';

// variable de colores
const Color _customColor = Color(0xFF00E8F0);
// constante con lista de colores
const List<Color> _colorThemes = [
  Colors.cyan,
  Color.fromARGB(127, 15, 187, 178),
  Colors.pink,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.amber,  
];

class AppTheme{

  // variable for select color
    final int selectedColor;

  AppTheme({
    this.selectedColor = 3
  });


  ThemeData theme() {

    // validacion por parte de la clase
    if(selectedColor >= 0 && selectedColor <= 5){
      return ThemeData(
        // return material3
        useMaterial3: true,

        colorSchemeSeed: _colorThemes[selectedColor],

        // tema oscuro
        brightness: Brightness.dark

      );
    }else{      
      throw Exception('el numero no corresponde');      
    }
  }
}