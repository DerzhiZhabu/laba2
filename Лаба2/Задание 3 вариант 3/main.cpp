#include <iostream>


using namespace std;

int main() {
	int n;
	cin >> n;
	int g;
	int count = 0;
	int h;
	for (int i = 0; i < n; i++) {
		cin >> g;
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