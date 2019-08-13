int cantidad=128;
int velocidad=8;
int dispersion=2;
float max_height;
int cuadros=0;
float[] llama_x=new float[cantidad];
float[] llama_y=new float[cantidad];
void setup() {
  size(512, 256);
  max_height=height*0.8;
  smooth();
  for (int i=0; i<cantidad; i++) {
    llama_x[i]=width*0.5;
    llama_y[i]=height*0.75;
  }
}
void draw() {
  background(0);
  for (int i=0; i<cantidad; i++) {
    stroke(255, 0, 0, random(128));
    fill(255, 255, 255, map(llama_y[i], max_height, 0, 255, 0));
    float radio_llama=map(llama_y[i], max_height, 0, 64, 8);
    ellipse(llama_x[i], llama_y[i], radio_llama, radio_llama);
    llama_x[i]+=random(-dispersion, dispersion);
    llama_y[i]-=random(velocidad);
    if (llama_y[i]<0) {
      llama_y[i]=max_height;
      llama_x[i]=width*0.5;
    }
  }
  cuadros++;
  println(cuadros);
  if (cuadros>=512&&cuadros<1024) {
    saveFrame("gif/space001-######.png");
  }
}
