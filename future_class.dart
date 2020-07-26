Animal newAnimal = Animal();

Future<Animal> getInt(){
  Future.delayed(Duration(seconds:5));
  newAnimal.name = "Cat";
  
  return Future.value(newAnimal);
}


class Animal {
  int legs =4;
  String name = "Elephant";
  
}

void main() {
  print('Fetching user order...');
  getInt().then((value)=>{print(value.name)});
}
