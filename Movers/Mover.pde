class Mover
{
  PVector velocity;
  PVector accleration;
  PVector location;
  float col;
  float mass;


  Mover(float tempC)
  {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    accleration = new PVector(0, 0);
    col = tempC;
    mass = random(1,2);
  }

  void applyForce(PVector force)
  {
    PVector f = PVector.div(force,mass);
    accleration.add(f);
    
  }

  void update()
  {
    velocity.add(accleration);
    location.add(velocity);
    accleration.mult(0);
    //velocity.limit(5);
  }

  void display()
  {
    noStroke();
    fill(col,20,50);
    ellipse(location.x, location.y, mass*25, mass*25);
  }

  void detect()
  {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}
