final int NUM_BULLETS = 3;
final int ANGLE_TO_TURN = 30;
final int NUM_SURVIVORS = 50;
final float ACCURACY = 0.7; // The closer to 1, the more accurate.

ArrayList<Survivor> survivors = new ArrayList<Survivor>();

void setup() {
  size(1000, 800);
  for (int i = 0; i < NUM_SURVIVORS; i++) {
    survivors.add(new Survivor(i, random(width), random(height), NUM_BULLETS, getInfected(), getInjured()));
  }
}

void draw() {
  background(240);
  Survivor temp; 
  for (Survivor s : survivors) {
    if (s.dead == false) {
      temp = s.findNearest(survivors);
      s.wanderBasedOn(temp.pos.x, temp.pos.y);
      for (Survivor t : survivors) {
        if (t.dead == false) {
          if (checkCollision(s, t)) {
            //At this point we don't know which of the survivors is infected
            //but we know one of them is. The ternary operator determines which is not yet.
            becomeZombie((s.infected) ? t : s);
            killZombie(t, s); //<>//
          }
        }
      }
      if (s.dead) {
        s.deathProtocol();
      }
      s.stateDeterminer();
    }
    s.display();
  }
  if (healthyProportion(survivors) < 0.2) {
    int a = survivors.size();
    survivors.add(new Survivor(a, random(width), random(height), NUM_BULLETS, false, getInjured()));
    survivors.add(new Survivor(a+1, random(width), random(height), NUM_BULLETS, false, getInjured()));
  }
  showAnalysis(survivors);
}

boolean getInfected() {
  return (random(1) > 0.6) ? true : false;
}

boolean getInjured() {
  return (random(1) > 0.75) ? true : false;
}

float healthyProportion(ArrayList<Survivor> survivors) {
  int h_num = 0;	
  int i_num = 0;
  for (Survivor s : survivors) {
    if (s.isHealthy()) {
      h_num ++;
    } else if (s.infected){
      i_num ++;
    }
  }

  return (1.0*h_num/(h_num+i_num));
}

int totalBulletsRemaining(ArrayList<Survivor> survivors) {
  int num = 0;
  for (Survivor s : survivors) {
    if (s.isHealthy()) {
      num += s.bullets;
    }
  }

  return num;
}

void showAnalysis(ArrayList<Survivor> survivors) { 
  fill(0);
  text("% of Healthy survivors: "+int(healthyProportion(survivors)*100), 10, height-40);
  text("Total bullets remaining: "+totalBulletsRemaining(survivors), 10, height-20);
}

boolean checkCollision(Survivor s1, Survivor s2) {
  if (s1.infected ^ s2.infected && s1 != s2) {
    if (s1.pos.dist(s2.pos) < s1.size) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

void becomeZombie(Survivor s) {
  if (s.isHealthy()) {
    s.infected = (random(1) > 0.7) ? true : false;
    if (!s.infected) {
      s.state_tracker = 0;
      s.state = s.PANIC;
    }
  } 

  //Cleans up remaining attributes that don't matter once infected.
  if (s.infected) {
    s.injured = false;
    s.bullets = 0;
  }
}

void killZombie(Survivor s1, Survivor s2) {
  if (s1.bullets > 0) {
    if (random(1) < ACCURACY) {
      s1.bullets --;
      s2.deathProtocol();
    }
  } else if (s2.bullets > 0) {
    if (random(1) < ACCURACY) {
      s2.bullets --;
      s1.deathProtocol();
    }
  }
}