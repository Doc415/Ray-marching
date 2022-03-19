class Wall{
  
  PVector startp;
  PVector endp;
  
  Wall(PVector _start, PVector _end){
    
    startp=_start.get();
    endp=_end.get();
    
  }
  
  void show(){
    strokeWeight(3);
    stroke(255);
    line (startp.x,startp.y,endp.x,endp.y);
  }
}
