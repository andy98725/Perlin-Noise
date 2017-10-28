class PerlinMap {
  public PImage PerlinImg;
  PerlinMap(float pixelX, float pixelY, float tileX, float tileY) {
    //Init
    PVector[][] PerlinVectorMap = new PVector[floor(tileX)+1][floor(tileY)+1];
    for (int i = 0; i <= tileX; i++) for (int j = 0; j <= tileY; j++) {
      PerlinVectorMap[i][j] = PVector.random2D();
    }

    //Generate Perlin Map
    PerlinImg = createImage(int(pixelX), int(pixelY), RGB);
    PerlinImg.loadPixels();
    for (int i = 0; i < PerlinImg.pixels.length; i++) {
      //Find coordinates
      float xloc = float(i % PerlinImg.width) / pixelX * tileX;
      float yloc = float(floor(i / PerlinImg.width)) / pixelY * tileY;
      //Get Relative vectors
      PVector PVul = new PVector(xloc - floor(xloc), yloc - floor(yloc));
      PVector PVur = new PVector(xloc - ceil(xloc), yloc - floor(yloc));
      PVector PVbl = new PVector(xloc - floor(xloc), yloc - ceil(yloc));
      PVector PVbr = new PVector(xloc - ceil(xloc), yloc - ceil(yloc));
      //Normalize
      PVul.normalize();
      PVur.normalize();
      PVbl.normalize();
      PVbr.normalize();
      //Take dot products
      float ul = PVul.dot(PerlinVectorMap[floor(xloc)][floor(yloc)]);
      float ur = PVur.dot(PerlinVectorMap[ceil(xloc)][floor(yloc)]);
      float bl = PVbl.dot(PerlinVectorMap[floor(xloc)][ceil(yloc)]);
      float br = PVbr.dot(PerlinVectorMap[ceil(xloc)][ceil(yloc)]);
      //Lerp values proportionally to find pixel value
      float l = lerp(ul, bl, yloc - floor(yloc));
      float r = lerp(ur, br, yloc - floor(yloc));
      float gradient = lerp(l, r, xloc - floor(xloc));
      //Assign pixel value
      PerlinImg.pixels[i] = color(128 + 128 * gradient);
    }
    //Load image
    PerlinImg.updatePixels();
  }
}