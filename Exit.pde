///I repurposed the code to make an exit button
class Button{
  //data declarations
 int x,y, size;  
 boolean over=false;//initalized to false
 boolean pressed=false;//initalized to false
 
 //constructor
 
 Button(int xIn, int yIn, int sIn ){
 
  x=xIn;
  y=yIn;
  size=sIn;
 
 }
 //methods
 boolean press(){
  if(over==true){
   pressed=true;
   return true;
  }
  else{ 
  return false;
  }
 }
 
 void update(){//checks to see if it is over the button
  if((mouseX>=x)&&(mouseX<=(x+size))&&(mouseY>=y)&&(mouseY<=(mouseY+size))){
  over=true;//it is over the button
  } 
  else{//only 2 options so use if/else
  over=false;
  }
 }
 
 void release(){
   //makes the pressed button release
  pressed=false; 
 }
 
 void show(){
  //shows the text 
  if(pressed==true){
exit();
  }
  //shows text of exiting the sketch
else if(over == true){
   text("Exit by Clicking Here", 45,450); 
  }
  
  stroke(255);//makes the outline
  rect(x,y,size,size);
 }
}