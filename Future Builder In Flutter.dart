import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    future: Animal().getName(),
    builder:(context, animalName){
      if(animalName.connectionState == ConnectionState.done){
        return Text('${animalName.data}', style: Theme.of(context).textTheme.headline4); 
    }else if(animalName.hasError){
        return Text("Ran into some error..") ;
      }
      else{
        return CircularProgressIndicator();
      }
      }
      
    );
      
      
      
  }
}

class Animal{
  
  
  String name ="Elephant";
  int legs =4;
  
  
  Future<String> getName()async {
    await Future.delayed(Duration(seconds: 3));
    return name;
  }
  
  
}
