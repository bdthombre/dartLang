void main() async{
  
 print("${Animal(customName:"Peacock").name} default name created.."); 
  
 Animal elephant = Animal.elephant();
  print("Class ${elephant.name} has ${elephant.legs} legs,");
  
  //Future name
 print("\n\nWith await function...");
 print(await elephant.getName());  //with using async funtion
  
  
 print("\n\nWithout await call...");
 var futureString = elephant.getName();
 futureString.whenComplete(()=>print("Completed.."));
 
  print("$futureString from when completed..");
  
  
  
 print("\n\nWaiting for then().....");
  
  //calling without async with then()
  var nameFromThen = elephant.getName().then((String value){
   print("$value form the then().");
 });
  
 //print(nameFromThen);
  
  //calling whenCompleted()
  print("\n\nSomething after getName()...");
  
  //from getTwoLegs() future function
  elephant.getTwoLegs().then((value){
    print("$value legged animal");
  });
  
}//main

class Animal{
  //Class that runs function when to set default values whne it runs
  
  
  String name;
  int legs;
  
  Animal({String customName})
    :name = customName,
     legs = 4;
  
  Animal.elephant({this.name, this.legs}){
    name = "Elephant";
    legs = 4;
    print("$name Animal class created");  //can run a fucntin with constructor
  }
  
  Future<String> getName() async {         
   var hello = await Future.delayed(
      Duration(seconds:2),
      ()=> "hello from the future"
    );
    return hello;
  }
  
  Future<int> getTwoLegs() async{
    await Future.delayed(Duration(seconds:4));
    legs = 2;
    return legs;
  }
  
  
  Future<String> getSecondName() async{     //Future functions has to be asynchronous if it wants to sent <T> data type
    
    return name;
  } 
  
  
}//Animal
