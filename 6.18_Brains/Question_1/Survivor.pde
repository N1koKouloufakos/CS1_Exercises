/*
  Create a Survivor class; a survivor will have a name, a location on the screen, an "infected" boolean, an "injured" boolean, 
 and a number of bullets carried. Add more data if you think it is warranted.
 
 Create an array of survivors and draw them on the screen (ellipses with names as labels are sufficient, 
 and the names can simply be unique numbers); draw them colour-coded to indicate whether they are healthy, infected, or injured. 
 Choose a certain percentage of the survivors to be infected to begin with.
 
 You want to know how viable your population of survivors is. Write two functions that take the array of survivors as the parameter:
 
 one will return a percentage of survivors who are completely healthy among all the survivors
 the other will return the number of bullets in the possession of healthy survivors
 Write code that calls both of these functions and draws the numbers with appropriate labels.
 
 Add movement to your simulation using a similar wandering movement used for the sheep in the simple AI demo. 
 The infected should slowly wander toward the closest of the non-infected survivors. 
 The healthy and injured should wander away from the closest infected, with the healthy moving more quickly than the injured. 
 You can adjust several of the values used for the sheep to adjust the wandering behaviour.
 
 Write a function called checkCollision that takes two survivor objects and returns a boolean. 
 The function should return true if the two survivors are touching or overlapping, but false otherwise. 
 Hint: Since both survivor objects are ellipses, an easy way to determine a collision is to check if the distance between the centres of the two ellipses is less than the sum of the two radii.
 
 Use your function to check for collisions between survivors every frame. 
 If an infected survivor is touching a healthy survivor, the healthy survivor should become infected 30% of the time. 
 On the other hand, if an infected survivor touches an injured survivor, the injured survivor should become infected 60% of the time.
 
 Use your function from above to check the percentage of healthy survivors every frame. 
 If the percentage gets lower than 20%, reinforcements will be called in to help your shrinking group 
 — 2 new non-infected survivors will spawn, and there will be a 25% chance they will be injured.
 
 You should make sure to set the various speeds of your survivors such that the simulation plays out slowly enough 
 to observe what is happening. Adjusting the window size, the number of survivors, and the chance of a survivor 
 being infected at the beginning, can also influence the speed of the simulation.
 
 If you have time, try to find a sweet spot for the above values, such that the simulation results in the 
 infected winning about half the time (by keeping the healthy population well below 20%) 
 and the humans winning about half the time (by running off the screen away from all of the infected and keeping the healthy population at least 20%).
 */


class Survivor {

  final int CASUAL = 1;
  final int PANIC = 2;
  final float TIRED = 0.7;
  final int VIEWING_DISTANCE = 8*size;

  int name;
  boolean injured, infected, dead;
  PVector pos, vel;
  int bullets;
  float accuracy = 0.7;
  int size = 20;
  float state = 1;
  int state_tracker = 0;
  int procreation_tracker = 0;


  
  Survivor(int name, float x, float y, int bullets, boolean infected, boolean injured) {
    this.name = name;
    this.pos = new PVector(x, y);
    this.vel = new PVector(0, 0);
    if (infected) {
      this.infected = infected;
      this.injured = false;
      this.bullets = 0;
    } else {
      this.infected = infected;
      this.injured = injured;
      this.bullets = bullets;
    }
  }  

  void display() {
    fill(colorState());
    ellipse(pos.x, pos.y, size, size);
    fill(0);
    text(name, pos.x, pos.y);

    //Every frame a survivor is displayed in a particular state,
    //it is tracked and affects what states it is able to go into next.
    state_tracker ++;
  }

  color colorState() {
    if (injured) {
      return color(255, 0, 0, 100);
    } else if (infected) {
      return color(200, 0, 200, 100);
    } else if (dead) {
      return color(200, 100);
    } else {
      return color(0, 200, 0, 100);
    }
  }

  boolean isHealthy() {
    if (!(infected || dead)) {
      return true;
    } else {
      return false;
    }
  }

  void wanderBasedOn(float x, float y) {
    //This code makes non-infected survivors wander away 
    //from the infected when they're within their field of view
    //and otherwise clump toward the center. This keeps the action on the screen ;)
    
    if (!this.infected && this.pos.dist(new PVector(x, y)) > VIEWING_DISTANCE) {
      vel.set(width/2+random(-width/10,width/10) - pos.x, height/2+random(-height/10,height/10) - pos.y);
      vel.mult(-1);
    } else {
      vel.set(x - pos.x, y - pos.y);
    }
    
    
    if (random(1) < 0.05) {
      if (vel.cross(pos).mag() > 0) {
        vel.rotate(radians(ANGLE_TO_TURN + random(-ANGLE_TO_TURN/4.0f, ANGLE_TO_TURN/4.0f)));
      } else {
        vel.rotate(-1*radians(ANGLE_TO_TURN + random(-ANGLE_TO_TURN/4.0f, ANGLE_TO_TURN/4.0f)));
      }
    }
    vel.normalize().mult(state);

    if (injured) {
      //Move slower if injured
      vel.mult(0.6);
    }

    if (this.infected == false) {
      pos.sub(vel);
    } else {
      pos.add(vel);
    }
  }

  Survivor findNearest(ArrayList<Survivor> survivors) {
    Survivor nearest = this;
    float d = -1;
    for (Survivor s : survivors) {
      if ((this.infected ^ s.infected) && this!=s && !(s.dead)) {
        float _d = this.pos.dist(s.pos);
        if (_d < d || d == -1) {
          d = _d;
          nearest = s;
        }
      }
    }
    return nearest;
  }

  void stateDeterminer() {
    //A survivor enters a state for a minimum of 30 frames.
    if (state_tracker >= 30) {
      state_tracker = 0;
      if (state == PANIC) {
        state = TIRED;
      } else if (state == CASUAL) {
        if (random(1) < 0.2) {
          state = TIRED;
        } else if (random(1) > 0.95) {
          state = PANIC;
        }
      } else if (state == TIRED) {
        if (random(1) < 0.9) {
          state = CASUAL;
        } else if (random(1) > 0.97) {
          state = PANIC;
        }
      }
    }
  }

  void deathProtocol() {
    this.dead = true;
    this.injured = false;
    this.infected = false;
  }
  
  void procreateWith(Survivor s, ArrayList<Survivor> survivors) {
    if (this.pos.dist(s.pos)<0.2*this.size) {
      survivors.add(new Survivor(survivor.size(), random(width),random(height), NUM_BULLETS, getInfected(), getInjured()));
    }
}