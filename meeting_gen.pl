#!/usr/local/bin/perl

use YAML;
use FindBin;
use Template;

my $yaml = shift;

open my $YAML, '<', $yaml or die "couldn't open <$yaml>: <$!>\n";
$data = Load( join '', <$YAML> );

my $t = Template->new( { include => "$FindBin::Bin/" } );

$t->process( 'meeting_announcement.tt', $data ) || die "$Template::Error\n";
