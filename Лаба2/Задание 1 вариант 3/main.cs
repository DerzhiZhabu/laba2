using System;

class Program
{
    static int CheckP(int x)
    {
        int b = 0;
        int z;
        for (int i = x; i > 1; i--)
        {
            z = 1;
            for (int j = 2; j <= (int)Math.Sqrt(i); j++)
            {
                if (i % j == 0)
                {
                    z = 0;
                    break;
                }
            }
            if (z == 1)
            {
                b = i;
                break;
            }
        }
        for (int i = x; i > 0; i++)
        {
            z = 1;
            for (int j = 2; j <= (int)Math.Sqrt(i); j++)
            {
                if (i % j == 0)
                {
                    z = 0;
                    break;
                }
            }
            if (z == 1)
            {
                if (x - b > i - x)
                {
                    b = i;
                }
                break;
            }
        }
        return b;
    }

    static void Main(string[] args)
    {
        int x = Convert.ToInt32(Console.ReadLine());
        Console.WriteLine(Math.Abs(x - CheckP(x)));
    }
}