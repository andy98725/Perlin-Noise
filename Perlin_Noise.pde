PerlinMap PMap;
void setup(){
  size(400,400);
  noStroke();
  PMap = new PerlinMap(400,400,20,20);
}

void draw(){
  image(PMap.PerlinImg,0,0);
}

/*
float tileCount = 20;
float si = 400;

PVector[][] PerlinVectorMap = new PVector[floor(si/tileCount)+1][floor(si/tileCount)+1];

void setup(){
  size(400,400);
  noStroke();
  
}
void draw(){
  background(255);
  
  //Loop all points
  for(float x = 0; x < si; x+=1) for(float y = 0; y < si; y+=1){
    //Generates coords with tile position and decimal for subposition
    float xloc = x/si*tileCount;
    float yloc = y/si*tileCount;
    //Calculate dot products of relative vectors with vectors in array
    float ul = (xloc - floor(xloc))*PerlinVectorMap[floor(xloc)][floor(yloc)].x + (yloc - floor(yloc))*PerlinVectorMap[floor(xloc)][floor(yloc)].y;
    float ur = (xloc - ceil(xloc))*PerlinVectorMap[ceil(xloc)][floor(yloc)].x + (yloc - floor(yloc))*PerlinVectorMap[ceil(xloc)][floor(yloc)].y;
    float bl = (xloc - floor(xloc))*PerlinVectorMap[floor(xloc)][ceil(yloc)].x + (yloc - ceil(yloc))*PerlinVectorMap[floor(xloc)][ceil(yloc)].y;
    float br = (xloc - ceil(xloc))*PerlinVectorMap[ceil(xloc)][ceil(yloc)].x + (yloc - ceil(yloc))*PerlinVectorMap[ceil(xloc)][ceil(yloc)].y;
    //Lerp 4 values together based off pos
    float l = lerp(ul, bl, yloc - floor(yloc));
    float r = lerp(ur, br, yloc - floor(yloc));
    float gradient = lerp(l, r, xloc - floor(xloc));
    
    //Draw point
    fill(255*gradient);
    rect(x,y,1,1);
  }
  //noLoop();
}*/