#include<iostream>
#include<math.h>
#include<vector>

using namespace std;

class Polynomial {
	public:
		unsigned int grado;
		vector<double> coeff;
		double value(double x) {
			double value = 0;
			int i = 0;
			for(double c : coeff) {
				value += c * pow(x, grado - i);
				i++;
			}
			return value;
		}
};

bool discordi(double x, double y) {
	return x*y < 0;
}

double find_zero(Polynomial p, double a, double b) {
	double f_a = p.value(a);
	double f_b = p.value(b);
	if (!discordi(f_a, f_b)) {
		cout << "p(" << a << ")*p(" << b << ") >= 0: ipotesi non verificata!" << endl;
		return a;
	}
	double c = (a+b)/2;
	double f_c = p.value(c);
	//cout << "p(" << c << ") = " << f_c << endl;
	printf("p(%.11f) = %.11f\n", c, f_c);
	if (f_c > 0 && f_c < 1e-10 || f_c < 0 && f_c > -1e-10) return c;
	if (discordi(f_a, f_c)) {
		return find_zero(p, a, c);
	} else {
		return find_zero(p, c, b);
	}
}

int main() {
	Polynomial p;
	cout << "Inserire il grado del polinomio: ";
	cin >> p.grado;
	double tmp;
	for(int i = 0; i <= p.grado; i++) {
		cout << "Inserire il coeff. di x^" << p.grado - i << ": ";
		cin >> tmp;
		p.coeff.push_back(tmp); // coeff are inverted (pos 0 -> x^grado, pos 1 -> x^(grado-1) .. pos n -> x^(grado-n))
	}
	// Versione dove si specifica l'intervallo
	/*
	double a, b;
	cout << "Inserire l'estremo inferiore dell'intervallo: ";
	cin >> a;
	cout << "Inserire l'estremo superiore dell'intervallo: ";
	cin >> b;
	double output = find_zero(p, a, b);
	if (output != a) cout << "Uno zero della funzione e' " << output;
	*/
	// Versione senza specificare l'intervallo
	if(p.value(0) == 0) {
		cout << "Uno zero della funzione e' 0";
		return 0;
	}
	double a = 0, r = pow(2, -30), output = 0;
	while(output == a && (r < pow(2, 30) || r > -pow(2, 30))) {
		r = (r > 0) ? -r : -r*2;
		output = find_zero(p, a, r);
	}
}
