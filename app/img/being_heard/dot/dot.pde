Vector data = new Vector(); //original data for each sentence
int column;
color[] yanse;  //for different contacters
int[] choice;  //if one contacter is chosen
Vector names = new Vector();
int next;
//matrix for each time view
statNode[][] yearMonth;
statNode[][] monthDay;
statNode[][] dayHour;
statNode[][] hourMinute;
int[][] dots;  //matrix for the minute-second time view
int mp;  //used to solve mouse clicking problem
int level;//to check which time view it is
int yy,mm,dd,hh;  //global year, month, day, hour for the current
int maxYM,maxMD,maxDH,maxHM;  //help to calculate the percentage scale
int absornot;  //change the scale to show
int tic;    //the speed of falling
int head, tail;  //the begin and end position of the whole data
String[] s;  //'absolutely' or 'percentage'
final int firstYear = 2006; //first year (used to check the previous and next button bound)
final int lastYear = 2010; //last year
boolean dropable = true;  //check if there's history to drop
boolean scrollable = false; //check if there are too many contacts for the page
float start;
int index;

//initial
void setup()
{
  size(1124,640);
  background(0);
  readfile();
  PFont font;
  font = createFont("STSong",12);
  textFont(font);
  yanse = new color[column];
  choice = new int[column];

  //set random colors
  for(int i =0; i<column; i++){
    yanse[i] = color(random(255),random(255),random(200)+55);
    choice[i] = 1;

    //Use the scrollbar to set which contacts to see if there are too many for the screen
    if (column > 28) {
      scrollable = true;

      //Set up the scroll bar
      hs1 = new HScrollbar(20, 40, 10, 560, 3);
    }

  }
  //the blocks
  dots = new int[60][60];
  hourMinute = new statNode[24][60];
  dayHour = new statNode[31][24];
  monthDay = new statNode[12][31];
  yearMonth = new statNode[5][12];
  maxYM = 0;
  maxMD = 0;
  maxDH = 0;
  maxHM = 0;
  next = 0;
  absornot = 1;
  yy = 2006;
  mm = 12;
  dd = 1;
  hh = 12;
  level = 0;
  //first time view is year-month 
  YearM();
  mp = 0;
  s = new String[2];

  s[0] = "Percentage";
  s[1] = "Absolute value";
}

//make the color brighter when the line it is chosen
color bright(color c)
{
  return color(red(c)+80, green(c)+80, blue(c)+80);
}

//to see if there is pre or next time period
boolean check(int y, int m, int d, int h){

  if(h>23){
    h = h%23;
    d++;
  }
  if(d>31){
    d = d%31;
    m++;
  }
  if(m > 12){
    y++;
    m = m%12;
  }
  if(y > lastYear){
    return false;
  }
  if(h<0){
    h = h+24;
    d--;
  }
  if(d<1){
    d = d+31;
    m--;
  }
  if(m < 1){
    y--;
    m = m+12;
  }
  if(y<firstYear){
    return false;
  }
  yy = y;
  mm = m;
  dd = d;
  hh = h;
  return true;
}


//the main process
void draw()
{

  //to see which time view we should call
  switch(level){
  case 0:
    drawYM();
    break;
  case 1:
    drawMD();
    break;
  case 2:
    drawDH();
    break;
  case 3:
    drawHM();
    break;
  case 4:
    drawMS();
    break;
  }

//  //the speed may be different according to the time view
//  tic = tic-level;
//  if(dropable)
//    drop();

  //set scale: percentage or absolute
  //if clicked, change the scale
  fill(255);
  text(s[absornot],50,600,200,20);
  if((mouseX>=50)&&(mouseY>=600)&&(mouseX<=200)&&(mouseY<=620)){  
    if(mousePressed){
      if(mp==0){
        mp++;
        if(absornot==0)
          absornot = 1;
        else
          absornot = 0;
      }
    }
    else
      mp = 0;
  }

  //to show the current time period
  String theDay = "";
  switch(level){
  case 0:
    break;
  case 1:
    theDay = String.valueOf(yy);
    break;
  case 2:
    theDay = yy + "-" + mm;
    break;
  case 3:
    theDay = yy + "-" + mm + "-" + dd;
    break;
  case 4:
    theDay = yy + "-" + mm + "-" + dd + " " + hh + ":00:00~" + hh + ":59:59";
    break;
  }
  fill(255);
  text(theDay, 40,20,200,20);


  //to show the previous and next button
  //if clicked, change to the previous or next time period
  if(level == 0)
    fill(150);
  text("Previous", 833,30,40,20);
  text("Next", 833,600,40,20);  
  if((mouseX>=833)&&(mouseY>=30)&&(mouseX<=873)&&(mouseY<=50)){
    if(mousePressed){
      if(mp==0){
        mp++;
        switch(level){
        case 0:
          break;
        case 1:
          if(check(yy-1,mm,dd,hh)){
            MonthD();
            drawMD();
          }
          break;
        case 2:
          if(check(yy,mm-1,dd,hh)){
            DayH();
            drawDH();
          }
          break;
        case 3:
          if(check(yy,mm,dd-1,hh)){
            HourM();
            drawHM();
          }
          break;
        case 4:
          if(check(yy,mm,dd,hh-1)){
            MinuteS();
            drawMS();
          }
          break;
        }
      }
    }
    else
      mp = 0;
  } 
  if((mouseX>=833)&&(mouseY>=600)&&(mouseX<=873)&&(mouseY<=620)){
    if(mousePressed){
      if(mp==0){
        mp++;
        switch(level){
        case 0:
          break;
        case 1:
          if(check(yy+1,mm,dd,hh)){
            MonthD();
            drawMD();
          }
          break;
        case 2:
          if(check(yy,mm+1,dd,hh)){
            DayH();
            drawDH();
          }
          break;
        case 3:
          if(check(yy,mm,dd+1,hh)){
            HourM();
            drawHM();
          }
          break;
        case 4:
          if(check(yy,mm,dd,hh+1)){
            MinuteS();
            drawMS();
          }
          break;
        }
      }
    }
    else
      mp = 0;
  }

  if (scrollable){
    //find scroll position
    float scrollpos = hs1.getPos();
    if (scrollpos < (column-28)){
      start = scrollpos;
      //System.out.println(start);
    } else {
      start = column-28;
    }
    
  } else {
    start = 0;
  }

  
  int end;
  if (scrollable){
    end = 28;
  } else {
    end = column;
  }
  //to show every contact's name and the selection block beside it
  //if clicked, change the status whether this contacter is chosen
  for (int j = 0; j < end; j++){
    index = j+int(start);
    //if (index < column){
    fill(yanse[index]);
    String name = (String)names.get(index);
    text(name, 50,40+j*20,200,20);
    rect(30,42+j*20,10,10);
    if(choice[index]==0){
      fill(0);
      rect(30+2,44+j*20,6,6);
    }

    if((mouseX>=30)&&(mouseY>=(42+j*20))&&(mouseX<=40)&&(mouseY<=(52+j*20))){
      if(mousePressed){
        if(mp==0){
          mp++;
          choice[index] = choice[index] ^1;
          if(level >=0)
            YearM();
          if(level >= 1)
            MonthD();
          if(level >= 2)
            DayH();
          if(level >= 3)
            HourM();
          switch(level){
          case 0:
            drawYM();
            break;
          case 1:
            drawMD();
            break;
          case 2:
            drawDH();
            break;
          case 3:
            drawHM();
            break;
          case 4:
            drawMS();
            break;
          }
        }
      }
      else
        mp = 0;
    }
   // }

    if (scrollable){    
      // Draw the scrollbar
      hs1.update();
      hs1.display();
    }
  }
}





