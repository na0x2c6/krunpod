#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use FindBin;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
require $FindBin::Bin . '/krunpod-config-parser.pm';

my $conf = shift;

my %podman = &parse_config('podman', $conf);

my $local_port = $podman{'local_port'};
if ($local_port !~ /^\d+$/) {
    die "the local_port is not specified";
}

print "tcp://127.0.0.1:$local_port";
