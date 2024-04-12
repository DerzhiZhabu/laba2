#include <iostream>


using namespace std;

int main() {
	int n;
	cin.exceptions(istream::failbit | istream::badbit);
	try
	{
		cin >> n;
	}
	catch (istream::failure e)
	{
		cerr << "Error" << endl;
		return 1;
	}
	int g;
	int count = 0;
	int h;
	for (int i = 0; i < n; i++) {
		try
		{
			cin >> g;
		}
		catch (istream::failure e)
		{
			cerr << "Error" << endl;
			return 1;
		}
		while (g > 0) {
			h = g % 10;
			g /= 10;
			if (h % 3 == 0) {
				count += h;
			}
		}
	}
	cout << count;
}
