package Zodiac::Angle;

use strict;
use warnings;

use Class::Utils qw(set_params);
use Readonly;
use Unicode::UTF8 qw(decode_utf8);

Readonly::Hash our %ZODIAC => (
	1 => decode_utf8('♈'), # Aries/Beran
	2 => decode_utf8('♉'), # Taurus/Býk
	3 => decode_utf8('♊'), # Gemini/Blíženci
	4 => decode_utf8('♋'), # Cancer/Rak
	5 => decode_utf8('♌'), # Leo/Lev
	6 => decode_utf8('♍'), # Virgo/Panna
	7 => decode_utf8('♎'), # Libra/Váhy
	8 => decode_utf8('♏'), # Scorpio/Štír
	9 => decode_utf8('♐'), # Sagittarius/Střelec
	10 => decode_utf8('♑'), # Capricorn/Kozoroh
	11 => decode_utf8('♒'), # Aquarius/Vodnář
	12 => decode_utf8('♓'), # Pisces/Ryby
);

our $VERSION = 0.03;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Process parameters.
	set_params($self, @params);

	return $self;
}

sub angle2zodiac {
	my ($self, $angle, $opts_hr) = @_;

	# Options.
	if (! defined $opts_hr) {
		$opts_hr->{'minute'} = 1;
	}
	my $full_angle_degree = int($angle);
	$angle -= $full_angle_degree;
	$angle *= 60;
	my $angle_minute = int($angle);
	my $sign = int($full_angle_degree / 30);
	my $angle_degree = $full_angle_degree - ($sign * 30);

	# Output.
	my $zodiac_angle = $angle_degree.decode_utf8('°').$ZODIAC{$sign + 1};
	if (exists $opts_hr->{'minute'} && $opts_hr->{'minute'}) {
		$zodiac_angle .= $angle_minute.decode_utf8("′");
	}

	return $zodiac_angle;
}

sub zodiac2angle {
	my ($self, $zodiac_angle) = @_;

	# TODO
	my $angle;

	return $angle;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Zodiac::Angle - Class for zodiac_angle manipulation.

=head1 SYNOPSIS

 use Zodiac::Angle;

 my $obj = Zodiac::Angle->new(%params);
 my $zodiac_angle = $obj->angle2zodiac($angle, $opts_hr);
 my $angle = $obj->zodiac2angle($zodiac_angle);

=head1 METHODS

=head2 C<new>

 my $obj = Zodiac::Angle->new(%params);

Constructor.

Returns instance of 'Zodiac::Angle'.

=head2 C<angle2zodiac>

 my $zodiac_angle = $obj->angle2zodiac($angle, $opts_hr);

Convert angle to Zodiac angle.

Options defined C<$opts_hr> control output. Possible keys in reference to hash
are: minute (0/1 print minutes).

Default value of C<$opts_hr> is { minute => 1 }.

Returns zodiac angle string.

=head2 C<zodiac2angle>

 my $angle = $obj->zodiac2angle($zodiac_angle);

Convert Zodiac angle to angle.

Returns angle.

=head1 ERRORS

 new():
         From Class::Utils::set_params():
                 Unknown parameter '%s'.

=head1 EXAMPLE1

 use strict;
 use warnings;

 use Zodiac::Angle;
 use Unicode::UTF8 qw(encode_utf8);

 # Object.
 my $obj = Zodiac::Angle->new;

 if (@ARGV < 1) {
         print STDERR "Usage: $0 angle\n";
         exit 1;
 }
 my $angle = $ARGV[0];

 my $zodiac_angle = Zodiac::Angle->new->angle2zodiac($angle);

 # Print out.
 print 'Angle: '.$angle."\n";
 print 'Zodiac angle: '.encode_utf8($zodiac_angle)."\n";

 # Output without arguments:
 # Usage: __SCRIPT__ angle

 # Output with '0.5' argument:
 # Angle: 0.5
 # Zodiac angle: 0°♈30′

=head1 EXAMPLE2

 use strict;
 use warnings;

 use Zodiac::Angle;
 use Unicode::UTF8 qw(encode_utf8);

 # Object.
 my $obj = Zodiac::Angle->new;

 if (@ARGV < 1) {
         print STDERR "Usage: $0 angle\n";
         exit 1;
 }
 my $angle = $ARGV[0];

 my $zodiac_angle = Zodiac::Angle->new->angle2zodiac($angle, {
         'minute' => 0,
 });

 # Print out.
 print 'Angle: '.$angle."\n";
 print 'Zodiac angle: '.encode_utf8($zodiac_angle)."\n";

 # Output without arguments:
 # Usage: __SCRIPT__ angle

 # Output with '0.5' argument:
 # Angle: 0.5
 # Zodiac angle: 0°♈

=head1 DEPENDENCIES

L<Class::Utils>,
L<Readonly>,
L<Unicode::UTF8>.

=head1 SEE ALSO

=over

=item L<Zodiac::Angle::SwissEph>

Class for zodiac_angle manipulation based on SwissEph.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Zodiac-Angle>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© Michal Josef Špaček 2020

BSD 2-Clause License

=head1 VERSION

0.03

=cut
