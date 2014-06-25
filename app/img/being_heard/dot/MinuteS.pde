void MinuteS()
{
  calc(yy,mm,dd,hh);
  for(int i = 0; i<60; i++)
    for(int j =0; j< 60; j++)
      dots[i][j] = -1;
  for(int i = 0; i < data.size(); i++){
    int y =  Integer.valueOf(((entity)data.get(i)).date.substring(0,4));
    int m =  Integer.valueOf(((entity)data.get(i)).date.substring(4,6));
    int d =  Integer.valueOf(((entity)data.get(i)).date.substring(6,8));
    int h =  Integer.valueOf(((entity)data.get(i)).time.substring(0,2));
    int minu = Integer.valueOf(((entity)data.get(i)).time.substring(3,5));
    int s = Integer.valueOf(((entity)data.get(i)).time.substring(6,8));
    if((y == yy)&&(m == mm)&&(d == dd)&&(h == hh)){
      dots[minu][s] = i;
    }
  }
  //int hour = ((entity)data.get(i)).time.substring(0,1);
}

void drawMS(){
  
  background(0);
  if(mousePressed)
  {
    if  (mouseButton == RIGHT) {
      if(mp==0){
        level = 3;
        calc(yy,mm,dd,-1);
        mp=1;
      }
    }
  }
  else
    mp = 0;
    
  int t=-1;
  for(int i = 0; i < 60; i++)
    for(int j = 0; j < 60; j++){
      if(dots[i][j]==-1)
        fill(30);
      else if(choice[((entity)data.get(dots[i][j])).col]==0)
        fill(30);
      else
        fill(yanse[((entity)data.get(dots[i][j])).col]);
      
      rect(213+10*j,21+10*i,8,8);
      if(((215+10*j)<=mouseX)&&((222+10*j)>=mouseX))
        if(((24+10*i)<=mouseY)&&((31+10*i)>=mouseY))
          //if(choice[((entity)data.get(dots[i][j])).col]==1) 
            t = dots[i][j];
    }
  
  fill(255);
  if(t!=-1){
    if ((((entity)data.get(t)).col-int(start)) >= 0){
      rect(26,38+(((entity)data.get(t)).col-int(start))*20,18,18);
    }
    fill(255);
    text(((entity)data.get(t)).content,mouseX+20,mouseY+20,200,500);
  }
  
  
}
