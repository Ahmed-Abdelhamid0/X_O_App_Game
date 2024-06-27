import 'package:flutter/material.dart';

AppBar gameAppBar(){
  return AppBar(
    backgroundColor: Colors.deepOrange,
    title: Text('Tic-Tac-Toe'),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
  );
}

Row PlayerScore(int xScore,int oScore){
  return   Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(children: [
        Text(
          'Player X',
          style: TextStyle(fontSize: 30,color: Colors.white),
        ),
        SizedBox(height: 20),
        Text(
          'Score : $xScore',
          style: TextStyle(fontSize: 30,color: Colors.deepOrange),
        ),
      ]),
      SizedBox(width: 80),
      Column(children: [
        Text(
          'Player O',
          style: TextStyle(fontSize: 30,color: Colors.white),
        ),
        SizedBox(height: 20),
        Text(
          'Score : $oScore',
          style: TextStyle(fontSize: 30,color: Colors.deepOrange),
        ),
      ]),
    ],
  );

}

Widget gameBoard(Function displayXO,List<String>showXO){
  return Expanded(
    child: GridView.builder(
      itemCount: 9,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          displayXO(index);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Text(
            showXO[index],
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}