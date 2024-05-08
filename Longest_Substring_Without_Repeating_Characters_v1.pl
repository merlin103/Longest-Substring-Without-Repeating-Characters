#!/bin/perl -w

use strict;
use feature 'say';
use List::Util qw/max/;

sub Longest_Substring_Without_Repeating_Characters{
	my @s = split('', $_[0]);
	my %seen;
	my $max = 0;
	my $left = 0;
	my $i = 0;
	
	foreach (@s){
		if (not exists $seen{$_}){
			$seen{$_} = $i;
		}
		else {
			$max = max($max, $i - $left);
			$left = $seen{$_} + 1; 
			$seen{$_} = $i;
		}

		$max = max($max, $i - $left) if ($i == $#s);
		$i++
	}

	return $max;
}

say(Longest_Substring_Without_Repeating_Characters('abcabcb')); # 3
say(Longest_Substring_Without_Repeating_Characters('pwwkew')); # 3
say(Longest_Substring_Without_Repeating_Characters('bbbb')); # 1
say(Longest_Substring_Without_Repeating_Characters('abbcefgh')); # 5


