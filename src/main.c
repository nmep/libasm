#include <stdio.h>
#include <string.h>
#include <unistd.h>

int		ft_strlen(char *str);
char	*ft_strcpy(char *dest, char *src);
int		ft_strcmp(char *s1, char *s2);
int		ft_write(int fd, const void *buf, size_t count);


int	main(int ac, char **av)
{
	if (ac == 0)
		return (1);
	// ft_strlen
	//printf("ft_strlen = %d\n", ft_strlen(av[1]));

	// ft_strcpy
	//printf("ft_strcpy = [%s]\n", ft_strcpy(av[1], av[2]));
	//printf("strcpy = [%s]\n", strcpy(av[1], av[2]));


	// ft_strcmp
	// printf("ft_strcmp = [%d]\n", ft_strcmp(av[1], av[2]));
	// printf("strcmp = [%d]\n", strcmp(av[1], av[2]));

	// ft_write
	printf("write = %ld\n", write(1, NULL, 0));
	printf("ft_write = %d\n", ft_write(1, NULL, 0));

	return 0;
}
