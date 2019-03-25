/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtrim_all.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gwyman-m <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/30 16:56:43 by gwyman-m          #+#    #+#             */
/*   Updated: 2019/03/25 23:33:17 by gwyman-m         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stdio.h>

static char	*recording(char const *s, size_t words, char *a)
{
	size_t i;
	size_t j;

	j = -1;
	i = 0;
	while (s[++j])
	{
		if (s[j] != 32 && s[j] != '\n' && s[j] != '\t')
		{
			while (s[j] && s[j] != 32 && s[j] != '\n' && s[j] != '\t')
				a[i++] = s[j++];
			words--;
			if (words > 0)
				a[i++] = ' ';
		}
	}
	return (a);
}

char		*ft_strtrim_all(char const *s)
{
	char	*a;
	size_t	n;
	size_t	i;
	size_t	k;
	size_t	words;

	if (!s)
		return (NULL);
	n = 0;
	i = 0;
	k = ft_strlen(s);
	words = ft_countwords(s);
	printf("!%s!\nwords are %ld\n", s, words);
	while (s[++i])
		if (s[n] == 32 || s[n] == '\n' || s[n] == '\t')
			n++;
	if (k >= n)
		a = ft_strnew(k - n + words - 1);
	else
		a = ft_strnew(1);
	if (!a)
		return (NULL);
	a = recording(s, words, a);
	return (a);
}
