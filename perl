perldoc perl
perldoc perltoc
perldoc perldsc     Perl datastructures
perldoc -f functionName

#!/usr/bin/perl -w
use strict;    #variable must be declared before they are used. my $name
use warnings;

my $name = "DF"
print "my name is $name";
print "my name is ${name}";

print - doesnt add newline
say - adds newline


Arrays
my @arr = (1,2,3,4,5,6)
print "$arr[-1] " #6
print $arr[0]
my @newarr = @arr[1,2] #2,3
my @newarr2 = @arr[0..2] #1,2,3
print "My favourite fruits are @fruits\n"; #whole array
print "Two types of fruit are @fruits[0,2]\n"; #array slice
print "My favourite fruit is $fruits[3]\n"; #single element

push @arr, 5; #add 5 to end of array
pop @arr; #pop from end of array
shift @arr #remove from beginning of array
unshift @arr, 0 #add 0 to beginning of array
unshift @arr, 1,2,3;
push @arr, 5..10;

my @new_arr = sort {$a <=> $b} @arr;

Length of the array
$len = $#arr + 1
$len = @arr

my @months = qw(jan feb mar apr) #quote words
print @fruits; #prints "applesorangesguavaspassionfruitgrapes"
print join("|", @fruits); #prints "apples|oranges|guavas|passionfruit|grapes"
print "@fruits"; #prints "apples oranges guavas passionfruit grapes"


Hashes - Only strings as keys
my %monthdays = ("jan",31,"feb",28);
my %monthdays = ( 
	jan => 31,   #quoting is not required if we use => operator. 
	feb => 28    #but string on right side must be quoted
);
print $monthdays{jan};
print $monthdays{"jan"};

Adding elements   $monthdays{mar} = 30;
Changing elements $monthday{feb} = 29;
Delete elements   delete($monthdays{mar});
Size of hash      my $len = keys %monthdays;
chech if key present = if (exists $monthdays{mar})

each(), keys(), values()

@ARGV  - array of arguments
%ENV  - hash of environment variables

Strings
my $str = "abc";
print length($str);
print uc($str);
print lc($str);
print lcfirst($str);
print ucfirst($str);
comparing string - cmp, lt, eq, gt,ne,ge,le
print hex($str) #return decimal value of hexadecimal string

my $char = chop $str; //removes last character
print $char; #c
print $string; #ab

substr($str,startPos, length); #returns substring 
substr($str, startPos, length, replacementString)
my $pos = index(string, substring) 
index(string,substring,offset)

my $str = "hello";
my @chars = split("",$str);
print "first character is $chars[0]\n"

split(regex,string); #returns list



#!/usr/bin/perl -w
use strict;
use warnings;
my %freq;
while (<>) {
	tr/A-Za-z/ /sc;
	foreach my $word (split(" ", lc $_)) {
		$freq{$word}++;
	}
}
foreach my $word (reverse(sort {$freq{$a} <=> $freq{$b}} keys %freq)) { 
	print "$word $freq{$word}\n";
}

while (my($word,$count) = each %freq) {
	print $word, $count, "\n";
}

for (my $i=0;$i<5;$i++) {
}
foreach my $value (@array) {
}

Subroutines
sub func {
my($a,$b) = @_;
}

sub func {
my(%args) = @_;   
my $name = $args{name} || "admin";
%args = (%defaults,%args);  //give defaults args
}
func(name=>"abc",passwd="bcd");

Regular expressions 
m/foo/i; matches on $_ by defaults. returns true if yes else on
while (<>) {
	print if m/foo/;
	print if /http:\/\//;
	print if m{http://};
}
$line = "abcd";
if ($line =~ m/^[a-z]$/i) { print "YES";}

$line = "fdafde"
$line =~ s/a/d/gi;

=~ matches
!~ doesnt match


References
sub median {
	my $ref_list = $_[0];
	my $len = $#$ref_list + 1;
	@list = sort {$a <=>$b} @$ref_list;
}
median(\@list);

"+>" - input and output from same file
open(INPUT,"<inp");
$line = <INPUT>;
open(OUTPUT,">output");
print OUTPUT "FD";
read(INPUT,$buf,255); #return number of characters read

