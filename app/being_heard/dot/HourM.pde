void HourM(){
  calc(yy,mm,dd,-1);
  for(int i = 0 ; i< 24; i++)
    for(int j = 0; j< 60; j++){
      hourMinute[i][j] = new statNode();
      hourMinute[i][j].feq = new int[column];
      for(int p = 0; p<column; p++)
        hourMinute[i][j].feq[p] = 0;
      int y = yy;
      int m = mm;
      int d = dd;
      int h = i+1;
      int minu = j+1;
      hourMinute[i][j].startTime = String.valueOf(y) + "." + String.valueOf(m) + "." + String.valueOf(d) + "  "+ String.valueOf(h) + ":"+String.valueOf(minu) + ":00";
      hourMinute[i][j].endTime = String.valueOf(y) + "." + String.valueOf(m) + "." + String.valueOf(d) + "  "+ String.valueOf(h) +":"+String.valueOf(minu) + ":59";
      hourMinute[i][j].sum = 0;
    }
  for(int i = 0; i < data.size(); i++){
    if(choice[((entity)data.get(i)).col]==1){
      int y =  Integer.valueOf(((entity)data.get(i)).date.substring(0,4));
      int m =  Integer.valueOf(((entity)data.get(i)).date.substring(4,6));
      int d =  Integer.valueOf(((entity)data.get(i)).date.substring(6,8));
      int h =  Integer.valueOf(((entity)data.get(i)).time.substring(0,2));
      int minu = Integer.valueOf(((entity)data.get(i)).time.substring(3,5));
      if((y == yy)&&(m == mm)&&(d == dd)){
      
        hourMinute[h][minu].feq[((entity)data.get(i)).col]++;
        if(((entity)data.get(i)).col !=0)
          hourMinute[h][minu].sum++;
      }
    }
  }
  maxHM = 0;
  for(int i = 0; i<24; i++)
    for(int j = 0; j< 60; j++){
      if(hourMinute[i][j].sum > maxHM)
        maxHM = hourMinute[i][j].sum;
    }
}

void drawHM()
{
  background(0);
  int row = -1;
  if((mouseX>=212)&&(mouseX<=812)&&(mouseY>=20)&&(mouseY<=620)){
    row = (mouseY-22)/25;
    fill(255);
    rect(211,20+25*row,602,25);
    String show = String.valueOf(row);
    text(show,820,28+25*row,200,25);
    if(mousePressed)
    { 
      if (mouseButton == LEFT) {
        if(mp==0){
          hh = row;
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
        level = 2;
        calc(yy,mm,-1,-1);
        mp=1;
      }
    }
  }
  else
    mp = 0;
  
  int t=-1;
  for(int i = 0; i < 24; i++)
    for(int j = 0; j < 60; j++){
      if(hourMinute[i][j].sum==0){
        fill(30);
        rect(213+10*j,22+25*i,8,21);
      }
      else{
        //fill(yanse[((entity)data.get(dots[i][j])).col]);
        int seg;
        if(absornot == 0)
          seg = 0;
        else
          seg = maxHM - hourMinute[i][j].sum;
        for(int p = 1; p< column; p++){
          if(hourMinute[i][j].feq[p]>0){
            if (i == row)
              fill(bright(yanse[p]));
            else
              fill(yanse[p]);
            if(absornot == 0)
              rect(213.0+10*j,round(22+25*i+21.0/hourMinute[i][j].sum*seg)+1,8,round(21.0-21.0/hourMinute[i][j].sum*seg)+1);
            else
              rect(213.0+10*j,round(22+25*i+21.0/maxHM*seg)+1,8,round(21.0-21.0/maxHM*seg)+1);
            seg = seg + hourMinute[i][j].feq[p];
          }
        }
      }
     // if(((215+10*j)<=mouseX)&&((222+10*j)>=mouseX))
      //  if(((24+10*i)<=mouseY)&&((31+10*i)>=mouseY))
       //   t = dots[i][j];
    }
  
  
}
