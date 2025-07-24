#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;


int			ft_strlen(char *str);
char		*ft_strcpy(char *dest, char *src);
int			ft_strcmp(char *s1, char *s2);
int			ft_write(int fd, const void *buf, size_t count);
ssize_t 	ft_read(int fd, void *buf, size_t count);
char		*ft_strdup(const char *s);

// bonus

int			ft_atoi_base(char *str, char *base);

t_list	*ft_lst_new(void *data)
{
	t_list	*node = malloc(sizeof(t_list));
	node->data = data;
	return node;
}

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
	// printf("write = %ld\n", write(1, NULL, 0));
	// printf("ft_write = %d\n", ft_write(1, NULL, 0));

	// // ft_read
	// char buff1[10] = {0};
	// char buff2[10] = {0};

	// int bytes_read = 0;
	// int bytes_ft_read = 0;

	// bytes_ft_read = ft_read(0, buff2, -1);
	// bytes_read = read(0, buff1, -1);
	
	// printf("read = [%s] | bytes read = %d\n", buff1, bytes_read);
	// printf("ft_read = [%s] | bytes read = %d\n", buff2, bytes_ft_read);


	// ft_strdup
	// printf("ft_strdup = [%s]\n", ft_strdup("bonjour"));

	// write(1, "qwer", 6);


	// BONUS

	// printf("atoi_base = [%d]\n", ft_atoi_base(" --9", av[1]));
	// printf("atoi = %d\n", atoi(av[1]));	

	// push front

	int num = 5;
	t_list	*list = ft_lst_new(&num);

	printf("node data = %d\n", *(int *)list->data);
	return 0;
}
