void main() async {
 
  //From Future
  print("waiting for future...");
  int number110 = await getInt();
  print(number110);
  
  //From Stream
  await for (int i in getStreamInt()){
    print(i);
  }
  
  
}




// async for singel future, async* for stream

//For future
Future<int> getInt() async{
  await Future.delayed(Duration(seconds:3));
  return 110;
}//Future

//For stream
Stream<int> getStreamInt() async*{
  for(int i=1; i<=5; i++){
    await Future.delayed(const Duration(seconds:1));
    yield i;
  }
}//Stream
