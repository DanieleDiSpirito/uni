#include <iostream>
#include <math.h>

using namespace std;

int divisors_sum(int n) {
	int sum = 1, i;
	for(i = 2; i < sqrt(n); i++) {
		if(n % i == 0) {
			sum += i + n/i;
		}
	}
	if(i == sqrt(n)) {
		sum += i;
	}
	return sum;
}

int main() {
	int a, b;
	cout << "Inserisci il primo numero:\t";
	cin >> a;
	cout << "Inserisci il secondo numero:\t";
	cin >> b;
	if(divisors_sum(a) == b && divisors_sum(b) == a) {
		cout << "I numeri sono amicali";
	} else {
		cout << "I numeri non sono amicali";
	}
}
