using System;

namespace Generator
{
	public class GuidGenerator
	{
		public static string GeneratorGuid()
		{
			return Guid.NewGuid().ToString("N");
		}
	}
}
