#include <string.h>
 
int main(void)
{
	float stack[70];
	float res;
	int m = 0;
	char query[100];
 
	printf("¬ведите выражение: ");
	gets(query);
 
	for (int i = 0; i <= strlen(query) - 1; i++)
	{
		if (query[i] >= '0' && query[i] <= '9')
		{
			stack[m] = query[i] - '0';
			m++;
			continue;
		}
 
		switch (query[i])
		{
			case '+':
			{
				res = stack[m - 2] + stack[m - 1];
				break;
			}	
			case '-':
			{
				res = stack[m - 2] - stack[m - 1];
				break;
			}
			case '*':
			{
				res = stack[m - 2] * stack[m - 1];
				break;
			}
			case '/':
			{
				res = stack[m - 2] / stack[m - 1];
				break;
			}
		}
 
		stack[m - 2] = res;
		m--;
	}
 
	printf("ќтвет: %f", res);
	getchar();
 
	return 0;
}