//this function is about the falling sentences at the right side
void drop(){
  
  for(int i = tic/10-61; i< tic/10; i++){
    if((i>=0)&&(i<data.size())){
      //String t = ((entity)data.get(i)).date + ((entity)data.get(i)).time.substring(0,2);
      int j = i + head;
      if((j>=head)&&(j<=tail)){
        fill(yanse[((entity)data.get(j)).col]);
        int y = tic-10*(i+1);
        //text(((entity)data.get(i)).content,(1024/column*((entity)data.get(i)).col),y);
        text(((entity)data.get(j)).content,875,y,270,15);
      }else
        tic = 0;
    }
  }
}
