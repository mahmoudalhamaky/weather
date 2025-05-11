import 'dart:io';

void main (){performance();}

      void performance  ()async{
        task1();
        String? RresultTask2 = await task2() ;
        task3(RresultTask2);
}

      void task1 (){
          String result ='task 1 data';
          print('task 1 done');
}

    Future<String?> task2 ()async{
                          Duration threeSeconds = Duration(seconds: 3);
                          String? result;
                      await   Future.delayed(threeSeconds, () {
                          result = "task 2 data";
                          print('task 2 done');
                          },);
            return result;
  //sleep(timeConsumed);
}
      void task3 (String? x){
  print('task 3 done with $x');
}