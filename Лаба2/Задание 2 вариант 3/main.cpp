#include <vector>
#include <iostream>
#include <string>
#include <map>


using namespace std;

int main() {
	char bs;
	int colc;
	string a;
	map<int, vector<int>> wh;
	vector<int> keys;
	map<char, int> col = { {'R', 0}, {'W', 1}, {'B', 2} };
	cin >> a;
	for (int i = 0; i < a.size() / 2; i++) {
		if (!isalpha(a[i * 2])) {
			cout << "Error";
			return 1;
		}
		if (!isdigit(a[i * 2 + 1])) {
			cout << "Error";
			return 1;
		}
		if (a[i * 2] != 'R' && a[i * 2] != 'W' && a[i * 2] != 'B') {
			cout << "Error";
			return 1;
		}
		colc = a[i * 2 + 1] - '0';
		if (wh.find(colc) != wh.end()) {
			wh[colc][col[a[i * 2]]] = 1;
		}
		else {
			wh[colc] = { 0, 0, 0 };
			wh[colc][col[a[i * 2]]] = 1;
			keys.push_back(colc);
		}
	}
	int count = 0;
	vector<int> b;
	for (int i = 0; i < keys.size(); i++) {
		b = wh[keys[i]];
		if (b[0] + b[1] + b[2] == 3) {
			count++;
		}
	}
	cout << count << endl;
}
