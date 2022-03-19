Wall [] wall;
Ray [] ray;
float rayangle;
int raycount=360;
float [] dist;
int wallcount=7;
float olddist;
int closestwall;
void setup(){
  fullScreen(P3D);
  wall=new Wall[wallcount];
  wall[5]=new Wall(new PVector(200,120),new PVector(400,400));
  wall[6]=new Wall(new PVector(1200,120),new PVector(1400,400));
  wall[4]=new Wall(new PVector(800,100),new PVector(800,600));
 
  wall[0]=new Wall(new PVector(0,0),new PVector(width,0));
  wall[1]=new Wall(new PVector(width,0),new PVector(width,height));
  wall[2]=new Wall(new PVector(width,height),new PVector(0,height));
  wall[3]=new Wall(new PVector(0,height),new PVector(0,0));
  //wall[2]=new Wall(new PVector(0,0),new PVector (100,100));
  //wall[4]=new Wall(new PVector(random(width),random(height)),new PVector(random(width),random(height)));
  //wall[1]=new Wall(new PVector(1000,1),new PVector(1200,100));
  //wall[3]=new Wall(new PVector(random(width),random(height)),new PVector(random(width),random(height)));
  
  dist=new float[wallcount];
  ray=new Ray[raycount];
  for (int i=0;i<ray.length;i++){
    ray[i]=new Ray(new PVector(100,height/2),rayangle);
    rayangle+=360/raycount;
  }
}


void draw(){
  background(0);
  for(int j=0;j<wall.length;j++){
  wall[j].show();
  }
 
 
    
  for (int i=0;i<ray.length;i++){
  ray[i].setdir((mouseX+pmouseX)/2,(mouseY+pmouseY)/2); 
  ray[i].show();
    olddist=10000;
    for (int w=0;w<wall.length;w++){
       ray[i].checkwalls(wall[w]);
       dist[w]=ray[i].u;
       if (dist[w]<olddist){closestwall=w;}
       olddist=dist[w];
  
       
} 
  
  ray[i].drawray(wall[closestwall]);  
 
  
}
}
