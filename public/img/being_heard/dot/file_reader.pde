import java.io.*;

//read all the data from the file and change it to entity instance
void readfile()
{
  String[] entities = loadStrings("1.dat");
  HashMap hm = new HashMap();
  column = 0;
 
//  for(int j=1; j<entities.length; j=j+2){
//    System.out.print(j);
//    System.out.print(": ");
//    System.out.println(entities[j]);
//  }
    
  for(int i = 0; i< entities.length; i++){
    String[] pieces = split(entities[i], "!@#$%");

    if(pieces.length > 1){
      //System.out.println(entities[i]);
      
      entity temp = new entity();
      temp.date = pieces[0];
      temp.time = pieces[1];
      temp.from = pieces[2];
      temp.to = pieces[3];
      temp.content = pieces[4];

      if(!hm.containsKey(temp.from)){
        hm.put(temp.from, column);
        names.add(temp.from);
        column = column +1;
      }
      //System.out.println(column);
      temp.col = (Integer)(hm.get(temp.from));
      data.add(temp);
    }
  }
}

