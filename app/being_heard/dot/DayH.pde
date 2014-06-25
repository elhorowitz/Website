void DayH(){
  calc(yy,mm,-1,-1);
  for(int i = 0 ; i< 31; i++)
    for(int j = 0; j< 24; j++){
      dayHour[i][j] = new statNode();
      dayHour[i][j].feq = new int[column];
      for(int p = 0; p<column; p++)
        dayHour[i][j].feq[p] = 0;
      int y = yy;
      int m = mm;
      int d = i+1;
      int h = j+1;
      dayHour[i][j].startTime = String.valueOf(y) + "." + String.valueOf(m) + "." + String.valueOf(d) + "  "+ String.valueOf(h) + ":00:00";
      dayHour[i][j].endTime = String.valueOf(y) + "." + String.valueOf(m) + "." + String.valueOf(d) + "  "+ String.valueOf(h) + ":59:59";
      dayHour[i][j].sum = 0;
    }
  for(int i = 0; i < data.size(); i++){
    if(choice[((entity)data.get(i)).col]==1){
      int y =  Integer.valueOf(((entity)data.get(i)).date.substring(0,4));
      int m =  Integer.valueOf(((entity)data.get(i)).date.substring(4,6));
      int d =  Integer.valueOf(((entity)data.get(i)).date.substring(6,8))-1;
      int h =  Integer.valueOf(((entity)data.get(i)).time.substring(0,2));
      if((y == yy)&&(m == mm)){
      
        dayHour[d][h].feq[((entity)data.get(i)).col]++;
        if(((entity)data.get(i)).col !=0)
          dayHour[d][h].sum++;
      }
    }
  }
  maxDH = 0;
  for(int i = 0; i<31; i++)
    for(int j = 0; j< 24; j++){
      if(dayHour[i][j].sum > maxDH)
        maxDH = dayHour[i][j].sum;
    }
}

void drawDH()
{
  background(0);
  int row = -1;
  if((mouseX>=212)&&(mouseX<=812)&&(mouseY>=20)&&(mouseY<=620)){
    row = (mouseY-10)/20;
    fill(255);
    rect(210,9+20*row,600,22);
    String show = String.valueOf(row+1);
    text(show,815, 14+20*row,200,22);
    if(mousePressed)
    { 
      if (mouseButton == LEFT) {
        if(mp==0){
          dd = row +1;
          
          MinuteS();
          level = 4;
          mp=1;
        }
      }
    }else{
      mp=0;
    }
  } else
  {
    row = -1;
  }
  
  if(mousePressed)
  {
    if  (mouseButton == RIGHT) {
      if(mp==0){
        level = 0;
        calc(yy,-1,-1,-1);
        mp=1;
      }
    }
  }
  else
    mp = 0;
  
  int t=-1;
  for(int i = 0; i < 31; i++)
    for(int j = 0; j < 24; j++){
      if(dayHour[i][j].sum==0){
        fill(30);
        rect(212+25*j,11+20*i,21,18);
      }
      else{
        //fill(yanse[((entity)data.get(dots[i][j])).col]);
        int seg;
        if(absornot == 0)
          seg = 0;
        else
          seg = maxDH - dayHour[i][j].sum;
        for(int p = 1; p< column; p++){
          if(dayHour[i][j].feq[p]>0){
            if (i == row)
              fill(bright(yanse[p]));
            else
              fill(yanse[p]);
            if(absornot == 0)
              rect(212.0+25*j,round(11+20*i+18.0/dayHour[i][j].sum*seg)+1,21,round(18.0-18.0/dayHour[i][j].sum*seg)+1);
            else
              rect(212.0+25*j,round(11+20*i+18.0/maxDH*seg)+1,21,round(18.0-18.0/maxDH*seg)+1);
            seg = seg + dayHour[i][j].feq[p];
          }
        }
      }
     // if(((215+10*j)<=mouseX)&&((222+10*j)>=mouseX))
      //  if(((24+10*i)<=mouseY)&&((31+10*i)>=mouseY))
       //   t = dots[i][j];
    }
  
  
}
