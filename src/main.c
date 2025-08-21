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
void		ft_swap(int *ptr, int *ptr2);

// bonus

int			ft_atoi_base(char *str, char *base);
void		ft_list_push_front(t_list **lst, t_list *new);
int 		ft_list_size(t_list *lst);
void		ft_list_sort(t_list **list, int cmp(void *, void *));
void		ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));


t_list	*ft_lst_new(void *data)
{
	t_list	*node = malloc(sizeof(t_list));
	node->data = malloc(sizeof(int));
	*(int *)(node->data) = *(int *)data;
	node->next = NULL;
	return node;
}

void	ft_print_list(t_list *list)
{
	t_list *tmp = list;
	while (tmp)
	{
		printf("data = %d\n", *(int *)(tmp->data));
		tmp = tmp->next;
	}
}

int	ft_cmp(void *a, void *b)
{
	printf("hi\n");
	printf("je cmp a = %d avec b = %d\n", *(int *)a, *(int *)b);
	return (*(int *)a - *(int *)b);
}

void free_fct(void *node_data)
{
	printf("free_fct\n");
	printf("ici je free %d\n", *(int *)node_data);
	free(node_data);
	node_data = NULL;
}

void ft_free_linked_list(t_list *list)
{
	t_list *tmp;

	while (list)
	{
		tmp = list;
		list = list->next;
		free(tmp->data);
		free(tmp);
	}
}

int	main(int ac, char **av)
{
	if (ac == 0)
		return (1);
	// ft_strlen
	printf("---------------- strlen ---------------- \n");

	char strlen_str[8] = "bonjour";
	printf("ft_strlen de [%s] = %d\n", strlen_str, ft_strlen(strlen_str));

	// ft_strcpy
	// printf("ft_strcpy = [%s]\n", ft_strcpy(av[1], av[2]));
	// printf("strcpy = [%s]\n", strcpy(av[1], av[2]));


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

	// int num = 5;
	// int num2 = 10;
	// t_list	*list = ft_lst_new(&num);
	// t_list	*new = ft_lst_new(&num2);

	// printf("node data = %d\n", *(int *)list->data);
	
	// printf("list avant push front\n");
	// ft_print_list(list);
	// ft_list_push_front(&list, new);

	// printf("list apres push front\n");
	// ft_print_list(list);


	// list size

	// int num = 5;
	// int num2 = 10;
	// t_list	*list = ft_lst_new(&num);
	// t_list	*new = ft_lst_new(&num2);

	// printf("list avant push front\n");
	// printf("lst size = %d == 1 ?\n", ft_list_size(list));
	// ft_print_list(list);
	// ft_list_push_front(&list, new);

	// printf("list apres push front\n");
	// printf("lst size = %d == 2 ?\n", ft_list_size(list));
	// ft_print_list(list);

	// printf("lst size = %d == 0 ?\n", ft_list_size(NULL));

	// sort list


	// int num = 2;
	// int num2 = 10;
	// int num3 = -5;
	// int num4 = 6;
	// t_list	*list = ft_lst_new(&num);
	// t_list	*new = ft_lst_new(&num2);
	// t_list	*new2 = ft_lst_new(&num3);
	// t_list	*new3 = ft_lst_new(&num4);

	// printf("list avant sort list\n");
	// ft_list_push_front(&list, new);
	// ft_list_push_front(&list, new2);
	// ft_list_push_front(&list, new3);
	// ft_print_list(list);

	// ft_list_sort(&list, &ft_cmp);
	// // sort_list(&list, &ft_cmp);

	// printf("list apres sort list\n");
	// ft_print_list(list);


	// remove_if


	// int num = 10;
	// int num2 = 10;
	// int num3 = 10;
	// int num4 = 10;

	// int data_ref = 10;

	// t_list	*list = ft_lst_new(&num);
	// t_list	*new = ft_lst_new(&num2);
	// t_list	*new2 = ft_lst_new(&num3);
	// t_list	*new3 = ft_lst_new(&num4);

	// ft_list_push_front(&list, new);
	// ft_list_push_front(&list, new2);
	// ft_list_push_front(&list, new3);
	
	// printf("list avant remove_if\n");
	// ft_print_list(list);

	// printf("avant remove if addr lst = %p\n", list);
	// ft_list_remove_if(&list, (void *)&data_ref, &ft_cmp, &free_fct);
	// printf("apres remove if addr lst = %p\n", list);

	// printf("list apres remove_if\n");
	// ft_print_list(list);

	// ft_free_linked_list(list);
	return 0;
}
