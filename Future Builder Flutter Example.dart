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
    return StreamBuilder<int>(
    stream: getCount(5),
    initialData: 0,
    builder:(context, count){
      if(count.connectionState == ConnectionState.waiting){
        return Text("Starting to count with:  ${count.data}");
      }
      else if(count.connectionState == ConnectionState.active){
        return Text("${count.data}");
      }else if(count.connectionState == ConnectionState.done){
        return Text("It's done with ${count.data} !");
      }
      else{
        return CircularProgressIndicator();
      }
      
    }
    );
      
      
      
  }
}


Stream<int> getCount(int count) async*{
  for(int i =1; i<= count; i++){
    await Future.delayed(const Duration(seconds:1));
    print(i);
    yield i;
  }
}
