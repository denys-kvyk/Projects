#include <iostream>
#define _USE_MATH_DEFINES
#include "cmath"
#include "math.h" 
using namespace std;

const int n = 3;
double ck()
{
	return M_PI / n;
}

double function(double x, int i)
{
	if (i == 0)
		return x;
	if (i == 1)
		return pow(cos(x - 1), 3.0);
	if (i == 2)
		return exp(x);
}

double weight_f(double x)
{
	return 1 / sqrt(1 - pow(x, 2));
}

double xk(double k)
{
	float a = cos((2 * k * M_PI - M_PI) / (2 * n));
	return a;
}

void main() {

	cout << "--- Integral f(x)/p(x) dx = c_[1]*f(x_[1]) + c_[2]*f(x_[2]) + c_[3]*f(x_[3]) ---\n\n -- p(x) = 1/sqrt(1-x^2) --\n \n n = 3 \n";
	float x_k[4], c_k[4];
	int b = 1, a = -1;
	x_k[0] = 0, c_k[0] = 0;
	float S;
	////////////////////////////.................x_k.............
	cout << "\n c_[k] = pi/n\t    x_[k] = cos((2k-1)pi / 2n)\n";
	for (int i = 1; i <= 3; i++)
	{
		x_k[i] = xk(i);
		c_k[i] = ck();
		if (abs(x_k[i]) < 1e-10)
			x_k[i] = 0;
		cout << "\n c_[" << i << "] = " << c_k[i] << "\t    x_[" << i << "] = " << x_k[i] << endl;
	}
	////////////////////////////.................c_k.............


	double tochne[] = { 0, 1.17634, 3.97746 };

	S = 0.0;
	for (int j = 0; j < 3; j++)
	{
		if (j == 0)
			cout << "\nf(x) = x \n Integral f(x)/p(x) dx = ";
		if (j == 1)
			cout << "\nf(x) = cos(x-1)^3 \n Integral f(x)/p(x) dx =  ";
		if (j == 2)
			cout << "\nf(x) = exp^x \n Integral f(x)/p(x) dx =  ";
		S = 0.0;
		for (int i = 1; i <= 3; i++)
		{
			S = S + c_k[i] * function(x_k[i], j);
			cout << " c_[" << i << "]*f(x_[" << i << "]) +";
		}
		cout << "\b = " << S << endl;
		cout << "\npohubka = " << (tochne[j] - S) << endl;
	}

	system("pause");
}
