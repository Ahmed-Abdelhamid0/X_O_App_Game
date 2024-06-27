import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets.dart';

class GameBoard extends StatefulWidget {
  GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  int oScore = 0;  int xScore = 0;  int drawCase=0;
  bool xTurn = true;  List<String> showXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  void displayXO(int index) {
    setState(() {
      if (xTurn && showXO[index] == '') {
        showXO[index] = 'X';
        drawCase+=1;
      } else if (!xTurn && showXO[index] == '') {
        showXO[index] = 'O';
        drawCase+=1;
      }
      xTurn = !xTurn;
      checkWinner();
    });
  }
  void checkWinner() {
    //Row Check
    if (showXO[0] == showXO[1] && showXO[0] == showXO[2] && showXO[0] != '') {
      showWinDialog(showXO[0]);
    }
    if (showXO[3] == showXO[4] && showXO[3] == showXO[5] && showXO[3] != '') {
      showWinDialog(showXO[3]);
    }
    if (showXO[6] == showXO[7] && showXO[6] == showXO[8] && showXO[6] != '') {
      showWinDialog(showXO[6]);
    }

    //Column Check
    if (showXO[0] == showXO[3] && showXO[0] == showXO[6] && showXO[0] != '') {
      showWinDialog(showXO[0]);
    }
    if (showXO[1] == showXO[4] && showXO[1] == showXO[7] && showXO[1] != '') {
      showWinDialog(showXO[1]);
    }
    if (showXO[2] == showXO[5] && showXO[2] == showXO[8] && showXO[2] != '') {
      showWinDialog(showXO[2]);
    }

    //Diagonal Check
    if (showXO[0] == showXO[4] && showXO[0] == showXO[8] && showXO[0] != '') {
      showWinDialog(showXO[0]);
    }
    if (showXO[6] == showXO[4] && showXO[6] == showXO[2] && showXO[6] != '') {
      showWinDialog(showXO[6]);
    }else if(drawCase==9){
      showDrawDialog();
    }
  }
  void showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.deepOrange,
          title: Text(
            'Draw Case',
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                clearBoard();
                Navigator.of(context).pop();
              },
              child: Text('Play Again !',style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
  void showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.deepOrange,
          title: Text(
            'Player $winner Win',
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                clearBoard();
                Navigator.of(context).pop();
              },
              child: Text('Play Again !',style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
    if (winner == 'O') {
      oScore++;
    } else {
      xScore++;
    }
  }
  void clearBoard() {
    setState(() {
      for(int i=0;i<9;i++){
        showXO[i]='';
        xTurn=true;
      }
    });
    drawCase=0;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: gameAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          children:
          [
           PlayerScore(xScore,oScore),
            SizedBox(height: 20),
            gameBoard(displayXO, showXO)
          ],
        ),
      ),
    );
  }
}
