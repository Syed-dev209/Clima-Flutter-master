import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  Future<String> x= task2();
  await task3(x);
  task4();

}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async  {
  String result;
  Duration threeSec=Duration(seconds: 3);
  //sleep(threeSec);//synchronus program

  await Future.delayed(threeSec,(){
    result = 'task 2 data';
    print('Task 2 complete');
  });
 return result;
}

void task3(Future task2Data) {
  String result = 'task 3 data';
   print('Task 3 complete with $task2Data');
}
void task4() {
  String result = 'task 4 data';
  print('Task 4 complete');
}

