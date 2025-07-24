#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int getNum(char c, char *base)
{
    int i = 0;
    while (base[i])
    {
        if (c == base[i])
        {
            printf("i = %d\n", i);
            return (i);
        }
        i++;
    }
    return -1;
}

int main(int ac, char **av)
{
    int i = 0;
    int num = 0;

    while (av[1][i])
    {
        num = num * strlen(av[2]) + getNum(av[1][i], av[2]);
        printf("av[1][%d] = %c | num = %d\n", i, av[1][i], num);
        i++;
    }

    printf("num = %d\n", num);
    return (0);
}