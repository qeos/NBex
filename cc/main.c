void _main(){
	int s,f,d,h,e;
	s = 1;
	f = 2;
	d = 3;
	h = 4;
	e = 5;
	_main1(1);
//	_main2(1,2);
}

int _main1(int b){
	int a;
	a = b;
	a = a + _main2(1,2);
	return a;
}

int _main2(int a, int c){
	int b;
	b = a;
	return b;
}