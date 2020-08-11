use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);
use Zodiac::Angle;

# Test.
my $obj = Zodiac::Angle->new;
my $ret = $obj->angle2zodiac(0.5);
is($ret, decode_utf8("0°♈30′"), 'Convert 0.5.');

# Test.
$ret = $obj->angle2zodiac(30.5);
is($ret, decode_utf8("30°♉30′"), 'Convert 30.5.');
