#use Tie::NetAddr::IP;
require "IP.pm";

# Some basic tests

$| = 1; 
print "1..10\n";

my $count = 1;

my %Test;

tie %Test, Tie::NetAddr::IP;

$Test{'1.0.0.0/8'} = 1;
$Test{'2.0.0.0/8'} = 2;
$Test{'3.0.0.0/8'} = 3;
$Test{'4.0.0.0/8'} = 4;
$Test{'5.0.0.0/8'} = 5;

for my $k (sort keys %Test) {
    if ($Test{$k} == $count) {
	print "ok $count\n";
    } else {
	print "not ok $count\n";
    }
    
    ++$count;
}

%Test = ();			# Try CLEAR

$Test{'1.0.0.0/8'} = 6;
$Test{'2.0.0.0/8'} = 7;
$Test{'3.0.0.0/8'} = 8;
$Test{'4.0.0.0/8'} = 9;
$Test{'5.0.0.0/8'} = 10;

for my $k (sort keys %Test) {
    if ($Test{$k} == $count) {
	print "ok $count\n";
    } else {
	print "not ok $count\n";
    }
    
    ++$count;
}

