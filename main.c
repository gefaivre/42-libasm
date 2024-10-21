#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>

#include "libasm.h"

/*
** Useful macros
*/
# define STRLEN(x)				printf("[%s] = %d\n", x, ft_strlen(x))
# define STRCPY(dest,src)		printf("str = %s | tes = %s\n", src, ft_strcpy(dest, src))
# define STRCMP(s1,s2)			printf("s1[%s] | s2[%s], result = %i\n", s1, s2, ft_strcmp(s1, s2))
# define WRITE(s, x)			printf("%s -> %ld\n", s, ft_write(STDOUT_FILENO, s, x));
# define READ(b, x)				r = ft_read(STDIN_FILENO, buffer, x); printf("`%s`:%ld\n", buffer, r); memset(buffer, 0, sizeof buffer);
# define DUP(s)					tmp = ft_strdup(s); printf("[%s] = [%s]\n", tmp, s); free(tmp); tmp = NULL;

void test_strlen()
{
	printf("---------------------- STRLEN ----------------------\n");
	STRLEN("");
	STRLEN("hello");
	STRLEN("world");
	STRLEN("0123456789abcdef");
	STRLEN("**");
	STRLEN("42");
	STRLEN("hello my dear");
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
	printf(" %i\n", strcmp("coucou", "coucou"));

	STRCMP("", "");
	printf(" %i\n", strcmp("", ""));

	STRCMP("ouasi", "ouais");
	printf(" %i\n", strcmp("ouasi", "ouais"));


	STRCMP("", "ouais");
	printf(" %i\n", strcmp("", "ouais"));

	STRCMP("001", "002");
	printf(" %i\n", strcmp("001", "002"));

	STRCMP("002", "001");
	printf(" %i\n", strcmp("002", "001"));

	printf("\n");
}

void test_write()
{
	printf("---------------------- WRITE ----------------------\n");
	WRITE("toto", 4L)
	printf("real ret -> %ld\n", write(STDOUT_FILENO, "toto", 4L));
	WRITE("totototo", 4L)
	printf("real ret -> %ld\n", write(STDOUT_FILENO, "totototo", 4L));
	WRITE("totototo", 8L)
	printf("real ret -> %ld\n", write(STDOUT_FILENO, "totototo", 8L));
	WRITE("toto", 2L)
	printf("real ret -> %ld\n", write(STDOUT_FILENO, "toto", 2L));
	WRITE("toto", 0)
	printf("real ret -> %ld\n", write(STDOUT_FILENO, "toto", 0));
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