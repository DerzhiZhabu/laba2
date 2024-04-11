using System;
using System.Collections.Generic;

class Program
{
    static void Main(string[] args)
    {
        int colc;
        string a;
        Dictionary<int, int[]> wh = new Dictionary<int, int[]>();
        List<int> keys = new List<int>();
        Dictionary<char, int> col = new Dictionary<char, int> { { 'R', 0 }, { 'W', 1 }, { 'B', 2 } };
        a = Console.ReadLine();
        for (int i = 0; i < a.Length / 2; i++)
        {
            colc = a[i * 2 + 1] - '0';
            if (wh.ContainsKey(colc))
            {
                wh[colc][col[a[i * 2]]] = 1;
            }
            else
            {
                wh[colc] = new int[3] { 0, 0, 0 };
                wh[colc][col[a[i * 2]]] = 1;
                keys.Add(colc);
            }
        }
        int count = 0;
        int[] b;
        foreach (int key in keys)
        {
            b = wh[key];
            if (b[0] + b[1] + b[2] == 3)
            {
                count++;
            }
        }
        Console.WriteLine(count);
    }
}