#include <iostream>
#include <vector>

std::vector<unsigned long long> factorials;

int factorial(int n) {
	if (n <= 1) {
		return 1;
	}
	unsigned long long res = factorial(n-1)*n;
	factorials.push_back(res);
	return res;
}

int main() {
	int input;
	factorials.push_back(1);
	factorials.push_back(1);
	std::cout << "Inserisci numero: ";
	std::cin >> input;
	factorial(input);
	std::cout << factorials.at(input);
	return 0;
}
