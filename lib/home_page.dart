import 'package:flutter/material.dart';
import 'package:new_app/game_buttons.dart';
import 'package:new_app/custom_dialog.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButtons>buttonsList;
   var player1;
  var player2;
  var activeplayer;
  @override
 
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonsList=doInit();

  }

    void playGame(GameButtons gb){
      setState(() {
        if(activeplayer==1)
        {
          gb.text="X";
          gb.bg=Colors.red;
          activeplayer=2;
          player1.add(gb.id);

        }
        else{
          gb.text="0";
          gb.bg=Colors.yellow;
          activeplayer=1;
          player2.add(gb.id);
        }
        gb.enabled=false;
        checkWinner();
      });
    }
void checkWinner()
{
  var winner= 0;
 
 { if(player1.contains(1)&& player1.contains(2)&& player1.contains(3))
  {winner=1; }
  
  if(player2.contains(1)&& player2.contains(2)&& player2.contains(3))
  {winner=2; }
  
  if(player1.contains(4)&& player1.contains(5)&& player1.contains(6))
  {winner=1; }
  
  if(player2.contains(4)&& player2.contains(5)&& player2.contains(6))

  {winner=2; }
  
  if(player1.contains(7)&& player1.contains(8)&& player1.contains(9))
  {winner=1; }
  
  if(player2.contains(7)&& player2.contains(8)&& player2.contains(9))
  {winner=2; }

  if(player1.contains(1)&& player1.contains(5)&& player1.contains(9))
  {winner=1; }

  
  if(player2.contains(1)&& player2.contains(5)&& player2.contains(9))
  {winner=2; }

  if(player1.contains(3)&& player1.contains(5)&& player1.contains(7))
  {winner=1; }

  if(player2.contains(3)&& player2.contains(5)&& player2.contains(7))
  {winner=2; }

  if(player1.contains(1)&& player1.contains(4)&& player1.contains(7))
  {winner=1; }
  
  if(player2.contains(1)&& player2.contains(4)&& player2.contains(7))
  {winner=2; }

  if(player1.contains(2)&& player1.contains(5)&& player1.contains(8))
  {winner=1; }

  if(player2.contains(2)&& player2.contains(5)&& player2.contains(8))
  {winner=2; }

  if(player1.contains(3)&& player1.contains(6)&& player1.contains(9))
  {winner=1; }

  if(player2.contains(3)&& player2.contains(6)&& player2.contains(9))
  {winner=2; }

 if(winner==1)
 {showDialog(context: context,
 builder: (_)=>CustomDialog("Player 1 won ", "Press the reset button to start again", resetGame)
 );
 }
 if(winner==2)
 {showDialog(context: context,
 builder: (_)=>CustomDialog("Player 2 won ", "Press the reset button to start again", resetGame)
 );
 }
 
}

if(winner==0)
 {
   if(buttonsList.every((p)=>p.text!=""))
   {showDialog(context: context,
 builder: (_)=>CustomDialog("NO one won ", "Press the reset button to start again", resetGame)
 );

   }
 
 }

}

void resetGame(){
  if(Navigator.canPop(context))Navigator.pop(context);
  setState(() {
    buttonsList=doInit();


  });
}


  List<GameButtons>doInit(){
    player1=new List();
    player2=new List();
    activeplayer=1;
    var gameButtonns=<GameButtons>[
      new GameButtons(id:1),
      new GameButtons(id:2),
      new GameButtons(id:3),
      new GameButtons(id:4),
      new GameButtons(id:5),
      new GameButtons(id:6),
      new GameButtons(id:7),
      new GameButtons(id:8),
      new GameButtons(id:9),
      
    ];
  
  return gameButtonns;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIC TAC TOE" ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: RaisedButton(onPressed: resetGame,
           child: Text("Reset game",style: TextStyle(color: Colors.cyan),),
           color: Colors.black45,
           
           
           
            ),
          )
        ],
        ),
    body: GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
      childAspectRatio: 1.0,
      crossAxisSpacing: 9,
      mainAxisSpacing: 9),
      itemCount: buttonsList.length,
      itemBuilder: (context,i)=>SizedBox(
        width:100.0,
        height:100.0,
        child: RaisedButton(
          padding: const EdgeInsets.all(8.0),
          onPressed: buttonsList[i].enabled?()=>playGame(buttonsList[i]):null,
          child: Text(buttonsList[i].text,
          style: TextStyle(color: Colors.purple,fontSize: 20.0),
          
          ),
        color: buttonsList[i].bg,
        disabledColor: buttonsList[i].bg,
        ),
        
      ),
    ),
    
    );
    
  }
}