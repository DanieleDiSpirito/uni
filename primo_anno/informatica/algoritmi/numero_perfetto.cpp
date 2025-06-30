#include <iostream>
#include <math.h>

using namespace std;

int main() {
	int n;
	cout << "Inserire il numero: ";
	cin >> n;
	int somma_div = 1;
	// Trovo i divisori
	for(int i = 2; i < sqrt(n) && somma_div <= n; i++) {
		if(n % i == 0) {
			somma_div += i + n/i;
		}
	}
	string output = (n == somma_div) ? " " : " non ";
	cout << n << output << "e' perfetto";
}
