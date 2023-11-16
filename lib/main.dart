import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/presentation/screens/chat/chat_screen.dart';
import 'package:yes_no_app/config/presentation/screens/chat_provider.dart';
import 'package:yes_no_app/config/themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      // listado de providers
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider() )
      ],

      child: MaterialApp(
        title: 'IsabelAPP',
    
        // quitar banner rojo
        debugShowCheckedModeBanner: false,
    
        // import theme
        theme: AppTheme(selectedColor: 0).theme(),
    
        // pantalla chat
        home: const ChatScreen(),
        
      ),
    );
  }
}