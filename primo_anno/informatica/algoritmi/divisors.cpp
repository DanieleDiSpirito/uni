#include <iostream>
#include <math.h> 	// sqrt
#include <stdlib.h>	// atoll

using namespace std;

unsigned long long int divisors[1000];

int find_div(unsigned long long int n) {
	int n_div = 0;
	int i = 1;
	while (i < sqrt(n)) {
		if (n % i == 0)	{
			divisors[n_div] = i;
			divisors[n_div+1] = n/i;
			n_div += 2;
		}
		i++;
	}
	return n_div;
}

void array_sort(unsigned long long int array[], int n_el) {
	int i;
	unsigned long long int sorted_array[n_el];
	for(i = 0; i < n_el/2; i++) {
		sorted_array[i] = array[i*2];
		sorted_array[n_el-i-1] = array[i*2 + 1];
	}
	for(i = 0; i < n_el; i++) {
		array[i] = sorted_array[i];
	}
}

int main(int argc, char** argv) {
	unsigned long long int n;
	if (argc > 1) {
		n = atoll(argv[1]);
	} else {
		cout << "Inserire un numero: ";
		cin >> n;
	}
	cout << "I divisori di " << n << " sono: " << endl;
	int n_div = find_div(n);
	array_sort(divisors, n_div);
	int i;
	for(i = 0; i < n_div; i++) {
		cout << divisors[i] << " ";
	}
}
