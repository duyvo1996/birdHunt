/****************************************************************************************/
/*Name: Duy Vo                            */
/*Email: duyvo@buffalo.edu                  */
/*Course: CSE113 A6       */
/*Date Started: 04/22/2017       */
/*Project: Final Project */
/*Date Completed: 05/11/2017    */
/*****************************************************************************************/
//set up with varibles, images, int, fonts, and booleans
PImage bird1;
PImage bird2;
PImage gameover;
PImage gun;
PImage deadbird;
PImage winner;
PImage menu;
PImage backgroundImg;
PImage background;
PImage range;
//font 
PFont Impact48;
//global variables
int q;
int r;
int j;
int xpos=0;
int x1pos=1;
int ypos;
int y1pos;
boolean hit = false;
boolean gotEm = false;
int strike=0;
int x;
int y;
int lastcount;
int time;
int keepTrackOfLast;
int slow;
int randomBird;
int last;
int area= 100;
int score=0;
int screensizex, screensizey;
int stage;
//hey! we have a class here
Button exit;

//setting up and loading images and fonts
void setup() {
  exit = new Button(25,425,50);
  frameRate(30);
  size(500,500);
  keepTrackOfLast = second();
  restart();
  smooth();
  cursor(CROSS);
  bird1=loadImage("bird1.jpg");
  bird2=loadImage("bird2.jpg");
  gun=loadImage("gun.png");
  deadbird=loadImage("deado.jpg");
  background=loadImage("background.jpg");
  range=loadImage("range.jpg");
  Impact48=loadFont("Impact48.vlw");
  gameover=loadImage("gameover.jpg");
   winner=loadImage("winner.png");
  stage = 1;
size(500,500);
menu = loadImage("menu.jpg");
image(menu,0,0,500, 500);
image(gun,0,0,1,1);

}
//start drawing the sketch
void draw()  {
 if(stage==1){
   //takes us to the main screen
    textAlign(LEFT);
    fill(0);
    text("BIRD HUNTER",50,140);
    text("Press any key to enter target mode",50,240);
    text("Target mode is untimed and you can shoot until you quit",50,270);
    text("Click mouse to enter normal mode",50,170);
    text("In normal mode, you can only let the birds escape three times before you lose", 50,200);
    text("You can win by getting 20 hits",50,220);
 
    text("Created by Duy Vo",50,70);
    //
    if(keyPressed == true){
      stage =2;
    }
    if(mousePressed == true){
      stage = 3;
    }
  }
  if(stage==2){
    background(255);
image (range,0,0,500,500);
   fill(255,0,0);
  rect (25,425,50,50);
    exit.update();
 //checks if the mouse is over the button
exit.show();


if (hit == true) {
  image(deadbird, x, y,50,50);
}
else {
  image(bird1,x, y,50,50);
}
//what happens when the mouse is clicked to fulfill push function
pushMatrix();
if (mousePressed) {
  rotate(-90);
}
  image(gun, mouseX, mouseY,70,70 );
  popMatrix();
  
  //to track bird hit and display them
  fill(255);
  textFont(Impact48);
  text("BIRDS KILLED:"+score,140,40);
  //boolean to determine when hit
if ((mousePressed == true) && (dist(mouseX, mouseY, x, y) <= area)) {
  hit = true;
}
else {
  hit = false;
}



//movement based on passage of time and a random number generator based on fixed value
if(second() - last > slow)  {
  int cat = int (random(1,6));
  
  //positions where the birds can appear
  if (cat == 1) {
    x = 222;
    y = 222;
  }
  else if (cat == 2) {
     x=11;
     y=13;
   }
   else if (cat == 3) {
       x=450;
       y= 91;
     }
     else if (cat == 4)  {
         x=250;
         y=250;
       }
       else if (cat == 5)  {
           x=400;
           y=420;
         }
         else if (cat == 6){
           x=250;
           y=490;
         }
         //print to keep track of seconds
         println ("Keep Count of Seconds");
         restart();
}





if (second() - keepTrackOfLast > 1000)  {
  time = time - 1;
  keepTrackOfLast = second();
}
  }
  //third stage, normal mode

if(stage==3){
  //implement the gun
  background(background);
  pushMatrix();
   image(gun, mouseX, mouseY,70,70 );
     popMatrix();

   //create target reticle
  cursor(CROSS);
  //makes the background
  
  //summon the birds
  image(bird1,xpos, ypos,60,60);
    image(bird2,x1pos, y1pos,60,60);
    //set value of the x 
  xpos+=q;
  x1pos+=j;
  
  //set value of y
  ypos=height/2;
  y1pos=height/3;
  
  //here's how we get the random position of the bird
   q=int(random(1,3));
   j=int(random(1,6));
   
   //way to identify when strike happens
   if(xpos>500){
     xpos=int(random(200,300));
     ypos=int(random(200,400));
     strike = strike+1;
  
   }
   if(x1pos>500){
     x1pos=int(random(100,200));
     y1pos=int(random(200,400));
     strike = strike+1;
   }
 //when hit
 if ((mousePressed == true) && (dist(mouseX, mouseY, xpos, ypos) <= area)) {
  hit = true;
}
else {
  hit = false;
}
    if (hit == true) {
  image(deadbird, xpos, ypos,50,50);
    }
  if ((mousePressed == true) && (dist(mouseX, mouseY, x1pos, y1pos) <= area)) {
  hit = true;
  if ((mousePressed == true) && (dist(mouseX, mouseY, xpos, ypos) <= area)) {
  hit = true;
  }
}
else {
  hit = false;
}

//if the bird is hit, we gonna show a dead bird
    if (hit == true) {
  image(deadbird, xpos, ypos,50,50);
  image(deadbird, x1pos, y1pos,50,50);
}
else {
  image(bird1,xpos, ypos,50,50);
}
//score and strike counter for normal mode
 fill(0);
  textFont(Impact48);
  //every successful shot increase this display by 1
  text("BIRDS KILLED:"+score,0,40);
  text("STRIKES:" +strike,0,100);
  
  //when we hit 3 strikes, this will display the loaded game over image and text
  if ( strike>= 3){
      image(gameover,0,0,500,500);
      fill(255,0,0);
    textSize(30);
      text("Reload Sketch and Try Again",100,400);
      textSize(15);
      text("*Also please help me pass this class",100,450);
    }
    if (score>= 20){
      image(winner,0,0,500,500);
    }
}
  //score display
}
//when the mouse is clicked we record the score and identify when we hit the birds
      void mouseClicked() {
    gotEm = true;
    
    if  ((gotEm == true) && (hit == true)){
      score = score +1;
      image(bird1,xpos, ypos,50,50);
      xpos = 0;
      x1pos=0; 
    }
    }
    //allow Button class to display text or exit sketch in target mode
    void mousePressed(){
 exit.press(); 
}

void mouseReleased(){
 exit.release(); 
}
//did not incorporate loops
//did not incorporate array
// allow time to change and move position of image in target
    void restart() {
  last = second();
 slow = int(random(1,1) *  1);
  println(slow);
  }
    