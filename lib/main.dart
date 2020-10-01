import 'package:flutter/material.dart';
import 'components/story_brain.dart';


void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}


StoryBrain storyBrain = new StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          )
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              choiceButton(1, storyBrain.getChoice1()),
              SizedBox(
                height: 20.0,
              ),
              choiceButton(2, storyBrain.getChoice2()),
            ],
          ),
        ),
      ),
    );
  }

  Expanded choiceButton(int cn,String ch) {
    return Expanded(
              flex: 2,
              child: FlatButton(
                onPressed: () {
                  //Choice 1 made by user.
                  setState(() {
                    storyBrain.nextStory(cn);
                  });
                },
                color: Colors.red,
                child: Text(
                 ch,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            );
  }
}