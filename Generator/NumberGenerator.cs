using System;

namespace Generator
{
    public class NumberGenerator
    {
		public static int GenerateNumber()
		{
			Random random = new Random();
			return random.Next(1, 1000 + 1); 
		}
	}
}
