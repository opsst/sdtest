void main() {
  firstSolution(1, 20);
  secondSolution();
  thirdSolution();
  forthSolution();
}

void firstSolution(int x, int y){
  var answer = 0;
  if(x > y){
    var ram = x;
    x = y;
    y = ram;
  }
  for(var i = x ; i <= y; i++ ){
    if(i%3==0||i%5==0){
      answer++;
    }
  }
  print('Solution 1 :');
  print(answer);
}

void secondSolution(){
  var answer1 = [];
  var answer2 = [];
  List<Map<String, dynamic>> data = [
    {'id': 1, 'name': 'Elephant', 'age': 50},
    {'id': 2, 'name': 'Dog', 'age': 5},
    {'id': 3, 'name': 'Cat', 'age': 5},
    {'id': 4, 'name': 'Ant', 'age': 1},
    {'id': 5, 'name': 'Alligator', 'age': 20},
    {'id': 6, 'name': 'Bird', 'age': 3},
    {'id': 7, 'name': 'Horse', 'age': 2},
    {'id': 8, 'name': 'Tiger', 'age': 24},
  ];

  // print(data[0]['id']);
  data.sort((a,b)=> a['age'].compareTo(b['age']));
  data.forEach((element) {
    if(element['age'] <= 20){
      answer1.add(element['name']);
    }
    if(element['name'][0].toString().toLowerCase() == 'a'){
      answer2.add(element['name']);
    }

  });
  print('Solution 2 :');
  print(answer1);
  print(answer2);

}

void thirdSolution(){
  List<int> data = [1,44,5,89,100, 1, 44];
  var max = 0;
  var answer = 0;
  for(var i = 0; i<data.length; i++){
    if (data[i] > max){
      answer = i;
      max = data[i];
    }
  }
  print('Solution 3 :');
  print(answer);
}

void forthSolution(){
  List<List<int>> data = [
    [1,2,3],
    [4,5,6],
    [7,8,9],
  ];
  var answer = [];
  data.forEach((array) {
    array.forEach((element) {
      answer.add(element);
    });
  });
  print('Solution 4 :');

  print(answer);
}