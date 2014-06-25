//because the format of the time stored in the original data is a string
//and the data of the current time is sotred separately in integer
//so in order to compare the time, we need to do the calculation

void calc(int y, int m, int d, int h){
  tic = 0;
  String begin, end;
  if(y == -1){
    begin = "0000";
    end = "9999";
  }else{
    begin = String.valueOf(y);
    end = String.valueOf(y);
  }
  
  if(m == -1){
    begin = begin + "00";
    end = end + "99";
  }else{
      begin = begin + toStr(m);
      end = end + toStr(m);
  }
  
  if(d == -1){
    begin = begin + "00";
    end = end + "99";
  }else{
      begin = begin + toStr(d);
      end = end + toStr(d);
  }
  if(h == -1){
    begin = begin + "00";
    end = end + "99";
  }else{
      begin = begin + toStr(h);
      end = end + toStr(h);
  }
  head = -1;
  tail = -2;
  for(int i = 0; i< data.size(); i++){
    String t = ((entity)data.get(i)).date + ((entity)data.get(i)).time.substring(0,2);
    if((t.compareTo(begin)>=0)&&(head == -1))
      head = i;
    if(t.compareTo(end)<=0)
      tail = i;
  }
  //System.out.println(begin);
  //println(end);
  if((head<0)||(tail<0))
    dropable = false;
  else
    dropable = true;
}

String toStr(int t)
{
  if (t<10)
    return "0" + String.valueOf(t);
  else
    return String.valueOf(t);
}
