void setup() {
	for (float i = 0; i < 1.5; i+=0.10){
		//Numbers will increase in accuracy from left to right. 
		println(test_randomBool(100, i)+", "
				+test_randomBool(1000, i)+", "
				+test_randomBool(10000, i));	
	}
}	
	/*
	Example Result:
0.0, 0.0, 0.0			|	p = 0
0.08, 0.118, 0.0957		|	p = 0.1
0.17, 0.186, 0.1978		|	p = 0.2
0.29, 0.282, 0.304		|	p = 0.3
0.42, 0.382, 0.3963		|	p = 0.4
0.55, 0.486, 0.4934		|	p = 0.5
0.62, 0.567, 0.5959		|	p = 0.6
0.7, 0.725, 0.7065		|	p = 0.7
0.77, 0.802, 0.7982		|	p = 0.8
0.87, 0.88, 0.9095		|	p = 0.9
1.0, 1.0, 1.0			|	p = 1.0
1.0, 1.0, 1.0			|	p = 1.1
1.0, 1.0, 1.0			|	p = 1.2
1.0, 1.0, 1.0			|	p = 1.3
1.0, 1.0, 1.0			|	p = 1.4
	*/


void draw() {
	
}

boolean randomBool(float p) {
//Outputs true p% of the time.  If p > 1, it always outputs true.
	float c = random(1);

	return (c < p) ? true : false;

}


float test_randomBool(int test_size, float p){
	//Tests randomBool a given number of times.
	//Should return a number similar to p with a big test size.
	int true_counter = 0;
  int false_counter = 0;
	for (int i = 0; i < test_size; i++) {
		if (randomBool(p)) {
			true_counter++;
		} else {
      false_counter++;
    }
	}

  //Now I have explicitly counted the true AND the false...
  //In order to use this, I could do the following
//  return float(true_counter)/(true_counter+false_counter)
  //But (true_counter+false_counter) = test_size,
  //So I'm going to substitute test size
	return float(true_counter)/test_size;

}