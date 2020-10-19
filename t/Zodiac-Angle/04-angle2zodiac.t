use strict;
use warnings;

use Test::More 'tests' => 13;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);
use Zodiac::Angle;

# Test.
my $obj = Zodiac::Angle->new;
my $ret = $obj->angle2zodiac(1.5);
is($ret, decode_utf8("1°♈30′"), 'Convert 1.5.');

# Test.
$ret = $obj->angle2zodiac(31.5);
is($ret, decode_utf8("1°♉30′"), 'Convert 31.5.');

# Test.
$ret = $obj->angle2zodiac(61.5);
is($ret, decode_utf8("1°♊30′"), 'Convert 61.5.');

# Test.
$ret = $obj->angle2zodiac(91.5);
is($ret, decode_utf8("1°♋30′"), 'Convert 91.5.');

# Test.
$ret = $obj->angle2zodiac(121.5);
is($ret, decode_utf8("1°♌30′"), 'Convert 121.5.');

# Test.
$ret = $obj->angle2zodiac(151.5);
is($ret, decode_utf8("1°♍30′"), 'Convert 151.5.');

# Test.
$ret = $obj->angle2zodiac(181.5);
is($ret, decode_utf8("1°♎30′"), 'Convert 181.5.');

# Test.
$ret = $obj->angle2zodiac(211.5);
is($ret, decode_utf8("1°♏30′"), 'Convert 211.5.');

# Test.
$ret = $obj->angle2zodiac(241.5);
is($ret, decode_utf8("1°♐30′"), 'Convert 241.5.');

# Test.
$ret = $obj->angle2zodiac(271.5);
is($ret, decode_utf8("1°♑30′"), 'Convert 271.5.');

# Test.
$ret = $obj->angle2zodiac(301.5);
is($ret, decode_utf8("1°♒30′"), 'Convert 301.5.');

# Test.
$ret = $obj->angle2zodiac(331.5);
is($ret, decode_utf8("1°♓30′"), 'Convert 331.5.');
