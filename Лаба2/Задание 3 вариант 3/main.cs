using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Enter the number of inputs followed by the values:");
        string[] inputs = Console.ReadLine().Split(' ');
        int n = int.Parse(inputs[0]);

        int count = 0;
        for (int i = 1; i <= n; i++)
        {
            int g = int.Parse(inputs[i]);
            while (g > 0)
            {
                int h = g % 10;
                g /= 10;
                if (h % 3 == 0)
                {
                    count += h;
                }
            }
        }
        Console.WriteLine(count);
    }
}
