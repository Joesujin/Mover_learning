Mover m[] = new Mover[12];



void setup()
{
  size(500, 500, P2D);
  for (int i=0; i< m.length; i++)
  {
    m[i] = new Mover(random(255));
  }
  smooth(8);
}
void draw()
{
  //background(0,10);
  fill(200);
  rect(0, 0, width, height);


  for (int i=0; i< m.length; i++)
  {
    //PVector f = new PVector(random(-0.5,0.5),random(0,0.5));
    //PVector f = new PVector(0.1,0.3);

    PVector gravity = new PVector(0, 0.3);
    gravity.mult(m[i].mass);
    m[i].applyForce(gravity);

    if (mousePressed)
    {
      PVector wind = new PVector(0.2, 0);
      m[i].applyForce(wind);
    }

    //m[i].applyForce(f);
    m[i].update();
    m[i].detect();
    m[i].display();
  }

  //delay(50);
}
