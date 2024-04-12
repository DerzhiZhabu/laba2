#include <math.h>
#include <iostream>


using namespace std;

int check_p(int x) {
    int b;
    int z;
    for (int i = x; i > 1; i--) {
        z = 1;
        for (int j = 2; j <= (int)sqrt(i); j++) {
            if (i % j == 0) {
                z = 0;
                break;
            }
        }
        if (z) {
            b = i;
            break;
        }
    }
    for (int i = x; i > 0; i++) {
        z = 1;
        for (int j = 2; j <= (int)sqrt(i); j++) {
            if (i % j == 0) {
                z = 0;
                break;
            }
        }
        if (z) {
            if (x - b > i - x) {
                b = i;
            }
            break;
        }
    }
    return b;
}

int main() {
    int x;
    cin.exceptions(istream::failbit | istream::badbit);
    try
    {
        cin >> x;
    }
    catch (istream::failure e)
    {
        cerr << "Error" << endl;
        return 1;
    }
    cout << abs(x - check_p(x)) << endl;
}
