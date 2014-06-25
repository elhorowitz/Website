void MonthD(){
  calc(yy,-1,-1,-1);
  for(int i = 0 ; i< 12; i++)
    for(int j = 0; j< 31; j++){
      monthDay[i][j] = new statNode();
      monthDay[i][j].feq = new int[column];
      for(int p = 0; p<column; p++)
        monthDay[i][j].feq[p] = 0;
      int y = yy;
      int m = i+1;
      int d = j+1;
      monthDay[i][j].startTime = String.valueOf(y) + "." + String.valueOf(m) + "." + String.valueOf(d) + "  00:00:00";
      monthDay[i][j].endTime = String.valueOf(y) + "." + String.valueOf(m) + "." + String.valueOf(d) + "  23:59:59";
      monthDay[i][j].sum = 0;
    }
  for(int i = 0; i < data.size(); i++){
    if(choice[((entity)data.get(i)).col]==1){
      int y =  Integer.valueOf(((entity)data.get(i)).date.substring(0,4));
      int m =  Integer.valueOf(((entity)data.get(i)).date.substring(4,6))-1;
      int d =  Integer.valueOf(((entity)data.get(i)).date.substring(6,8))-1;
      if(y == yy){
      
        monthDay[m][d].feq[((entity)data.get(i)).col]++;
        if(((entity)data.get(i)).col !=0)
          monthDay[m][d].sum++;
      }
    }
  }
  maxMD = 0;
  for(int i = 0; i<12; i++)
    for(int j = 0; j< 31; j++){
      if(monthDay[i][j].sum > maxMD)
        maxMD = monthDay[i][j].sum;
    }  
}

void drawMD()
{
  background(0);
  int row = -1;
  if((mouseX>=212)&&(mouseX<=812)&&(mouseY>=20)&&(mouseY<=620)){
    row = (mouseY-20)/50;
    fill(255);
    rect(211,20+50*row,622,50);
    String show = String.valueOf(row+1);
    text(show,840,45+50*row,100,50);
    if(mousePressed)
    { 
      if (mouseButton == LEFT) {
        if(mp==0){
          mm = row +1;
          DayH();
          level = 2;
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
        calc(-1,-1,-1,-1);
        mp=1;
      }
    }
  }
  else
    mp = 0;
  
  int t=-1;
  for(int i = 0; i < 12; i++)
    for(int j = 0; j < 31; j++){
      if(monthDay[i][j].sum==0){
        fill(30);
        rect(213+20*j,22.0+50*i,18,46.0);
      }
      else{
        //fill(yanse[((entity)data.get(dots[i][j])).col]);
        int seg;
        if(absornot == 0)
          seg = 0;
        else
          seg = maxMD - monthDay[i][j].sum;
        for(int p = 1; p< column; p++){
          if(monthDay[i][j].feq[p]>0){
            if (i == row)
              fill(bright(yanse[p]));
            else
              fill(yanse[p]);
            if(absornot == 0)
              rect(213.0+20*j,round(22+50*i+46.0/monthDay[i][j].sum*seg)+1,18,round(46.0-46.0/monthDay[i][j].sum*seg)+1);
            else
              rect(213.0+20*j,round(22+50*i+46.0/maxMD*seg)+1,18,round(46.0-46.0/maxMD*seg)+1);
            seg = seg + monthDay[i][j].feq[p];
          }
        }
      }
     // if(((215+10*j)<=mouseX)&&((222+10*j)>=mouseX))
      //  if(((24+10*i)<=mouseY)&&((31+10*i)>=mouseY))
       //   t = dots[i][j];
    }
  
  
}
