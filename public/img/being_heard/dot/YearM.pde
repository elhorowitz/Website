
//to calculate the data based on the year-month time view
void YearM(){
  calc(-1,-1,-1,-1);
  println(head);
  println(tail);
 
  for(int i = 0 ; i< 5; i++)
    for(int j = 0; j< 12; j++){
      yearMonth[i][j] = new statNode();
      yearMonth[i][j].feq = new int[column];
      for(int p = 0; p<column; p++)
        yearMonth[i][j].feq[p] = 0;
      int y = 2006+i;
      int m = i+1;
      yearMonth[i][j].startTime = String.valueOf(y) + "." + String.valueOf(m) + "." + "1";
      yearMonth[i][j].endTime = String.valueOf(y) + "." + String.valueOf(m) + "." + "31";
      yearMonth[i][j].sum = 0;
    }
  for(int i = 0; i < data.size(); i++){
    if(choice[((entity)data.get(i)).col]==1){
      int y =  Integer.valueOf(((entity)data.get(i)).date.substring(0,4))-2006;
      int m =  Integer.valueOf(((entity)data.get(i)).date.substring(4,6))-1;
      //int d =  Integer.valueOf(((entity)data.get(i)).date.subString(6,7));
      
      yearMonth[y][m].feq[((entity)data.get(i)).col]++;
      if(((entity)data.get(i)).col !=0)
        yearMonth[y][m].sum++;
    }
  }
  maxYM = 0;
  for(int i = 0; i<5; i++)
    for(int j = 0; j< 12; j++){
      if(yearMonth[i][j].sum > maxYM)
        maxYM = yearMonth[i][j].sum;
    }
}

//the main drawing on the year-month time view
void drawYM()
{
  background(0);
  //if the mouse is in the blocks range, show which line the mouse is pointing
  int row = -1;
  int columns = -1;
  if((mouseX>=212)&&(mouseX<=812)&&(mouseY>=20)&&(mouseY<=320)){
    row = (mouseY-20)/60;
    columns = (mouseX-212)/50;
    
    fill(255);
    rect(212+50*columns,20+60*row,50,60);
    String showM = String.valueOf(columns+1);
    String showY = String.valueOf(row+2006);
    text(showM,234+50*columns,6,100,60);
    text(showY,820,45+60*row,100,60);
    //if clicked, show the next time view
    if(mousePressed)
    {
      if (mouseButton == LEFT) {
        if(mp==0){
          yy = row + 2006;
          mm = columns + 1;
          DayH();
          level = 2;
          mp=1;
        }
      }
    }else{
      mp=0;
    }
  }
  
  //to draw every block
  int t=-1;
  for(int i = 0; i < 5; i++)
    for(int j = 0; j < 12; j++){
      if(yearMonth[i][j].sum==0){
        fill(30);
        rect(214+50*j,22+60*i,46,56);
      }
      else{
        fill(yanse[((entity)data.get(dots[i][j])).col]);
        float seg;
        if(absornot == 0)
          seg = 0;
        else
          seg = (maxYM) - (yearMonth[i][j].sum);
          //seg = log(maxYM-yearMonth[i][j].sum);
        float ratio = sqrt(1.0*yearMonth[i][j].sum/maxYM)*maxYM/yearMonth[i][j].sum;
        
        for(int p = 1; p< column; p++){
          if(yearMonth[i][j].feq[p]>0){
            if (i == row)
              fill(bright(yanse[p]));
            else
              fill(yanse[p]);
            
            if(absornot == 0)
              rect(214+50*j,22+60*i+round(56.0/yearMonth[i][j].sum*seg)+1,46,56.0-round(56.0/yearMonth[i][j].sum*seg)-1);
              //rect(214+50*j,22+60*i+56.0/log(yearMonth[i][j].sum)*log(seg),46,56.0-56.0/log(yearMonth[i][j].sum)*log(seg));
            else
              //rect(214+50*j,22+60*i+56.0/maxYM*seg,46,56.0-56.0/maxYM*seg);
              rect(214+50*j,round(22+60*i+56.0-(56.0-56.0/maxYM*seg)*ratio)+1,46,round((56.0-56.0/maxYM*seg)*ratio)+1);
              //rect(214+50*j,22+60*i+56.0/log(maxYM)*(seg),46,56.0-56.0/log(maxYM)*(seg));
            seg = seg + (yearMonth[i][j].feq[p]);
          }
        }
      }
     // if(((215+10*j)<=mouseX)&&((222+10*j)>=mouseX))
      //  if(((24+10*i)<=mouseY)&&((31+10*i)>=mouseY))
       //   t = dots[i][j];
    }
  
  fill(255);
  
  if(t!=-1){
    rect(26,38+((entity)data.get(t)).col*20,18,18);
    fill(255);
    text(((entity)data.get(t)).content,mouseX+20,mouseY+20,200,100);
  }
}
