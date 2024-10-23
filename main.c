#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>

#include "libasm.h"

/*
** Useful macros
*/
# define STRLEN(x)				printf("[%s]\nlibasm -> %zu \nstrlen -> %zu \n\n", x, ft_strlen(x), strlen(x))
# define STRCPY(dest,src)		printf("[%s]\nlibasm -> [%s]\nstrcpy -> [%s]\n\n", src, ft_strcpy(dest, src), strcpy(dest, src))
# define STRCMP(s1,s2)			printf("s1[%s] | s2[%s]\nlibasm -> %i\nstrcmp -> %i\n\n", s1, s2, ft_strcmp(s1, s2), strcmp(s1, s2))
# define WRITE(s, x)			printf("\n[%s]\nlibasm -> %ld\nwrite -> %ld\n\n", s, ft_write(STDOUT_FILENO, s, x), write(STDOUT_FILENO, s, x));
# define READ(b, x)				r = ft_read(STDIN_FILENO, buffer, x); printf("%s%ld\n", buffer, r); memset(buffer, 0, sizeof buffer); printf("------------------------\n");
# define DUP(s)					tmp = ft_strdup(s), tmp2 = ft_strdup(s); printf("[%s]\nlibasm ->[%s]\nstrdup -> [%s]\n\n", s, tmp, tmp2); free(tmp); tmp = NULL;

void test_strlen()
{
	printf("---------------------- STRLEN ----------------------\n");
	STRLEN("");
	STRLEN("hello");
	STRLEN("world");
	STRLEN("0123456789abcdef");
	STRLEN("**");
	STRLEN("42");
	STRLEN("hello \0my dear");
	printf("\n");
}

void test_strcpy()
{
	char dest[1048];

	printf("---------------------- STRCPY ----------------------\n");
	STRCPY(dest, (const char *)"coucou");
	STRCPY(dest, (const char *)"");
	STRCPY(dest, (const char *)"testtest");
	STRCPY(dest, (const char *)"cotestucou");
	STRCPY(dest, (const char *)"prout");
	printf("\n");
}

void test_strcmp()
{
	printf("---------------------- STRCMP ----------------------\n");
	STRCMP("coucou","coucou");
	STRCMP("", "");
	STRCMP("ouasi", "ouais");
	STRCMP("", "ouais");
	STRCMP("001", "002");
	STRCMP("002", "001");
}

void test_write()
{
	printf("---------------------- WRITE ----------------------\n");
	WRITE("toto", 4L)
	WRITE("totototo", 4L)
	WRITE("totototo", 8L)
	WRITE("toto", 2L)
	WRITE("toto", 0)
}

void test_read()
{
	char	buffer[100];
	long r = 0;
	memset(buffer, 0, sizeof buffer);

	printf("---------------------- READ ----------------------\n");
	READ(buffer, 50)
	READ(buffer, 25)
	READ(buffer, 4)
	READ(buffer, 26)
	READ(buffer, 14)
	READ(buffer, 0)
}

void test_strdup()
{
	char	*tmp;
	char	*tmp2;

	printf("---------------------- STRDUP ----------------------\n");
	DUP("salut");
	DUP("coucou");
	DUP("\n");
	DUP("ok");
	DUP("dfsgdfdfdgfadsgdgghfdsag dsfh tdfh fhefh trs hrzehty ");
	DUP("");
	DUP("42");
}



int main(void)
{
	test_strlen();
	test_strcpy();
	test_strcmp();
	test_write();
	test_read();
	test_strdup();
}