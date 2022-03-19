class Ray{
  PVector point, dir;
  float t,u,intersectx,intersecty,den,alpha;
  Wall cw;
  
  Ray(PVector _point, float _alpha){
    point=_point.get();
    alpha=_alpha;
    dir=new PVector( cos(radians(alpha)),sin(radians(alpha)));
   
  }
  
  void show(){
    alpha+=0;
    dir.x=cos(radians(alpha));
    dir.y=sin(radians(alpha));
    
    pushMatrix();
    translate(point.x,point.y);
    stroke(255);
    //stroke(255,255,0,100);
    circle(0,0,20);
    line(0,0,dir.x*10,dir.y*10);
    popMatrix();
  }

  void setdir(float _x, float _y){
    point.x=_x;
    point.y=_y;
    
  }
  
  boolean checkwalls(Wall _cw){
    cw=_cw;
    
    float x1=cw.startp.x;
    float y1=cw.startp.y;
    float x2=cw.endp.x;
    float y2=cw.endp.y;
    
    float x3=point.x;
    float y3=point.y;
    float x4=dir.x+point.x;
    float y4=dir.y+point.y;
    
      
   
    den=(x1-x2)*(y3-y4)-(y1-y2)*(x3-x4);
    if (den==0) {return false;}
    
        t=((x1-x3)*(y3-y4)-(y1-y3)*(x3-x4))/den;
        u=-((x1-x2)*(y1-y3)-(y1-y2)*(x1-x3))/den;
      
        if (t>0 && t<1 && u>0){
          intersectx=point.x+dir.x*u;
          intersecty=point.y+dir.y*u;
                   return true;    
    
        } else {return false;}
          
  }
   
 void drawray(Wall _cf){
    float col=dist(point.x,point.y,intersectx,intersecty);
          col=map(col,5,width,0,255);
          colorMode(HSB);
         // stroke(col,255,255,100);
          stroke(15,255,255,50);
          line(point.x,point.y,intersectx,intersecty);
}
    
}
