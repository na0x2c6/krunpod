#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use FindBin;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
require $FindBin::Bin . '/krunpod-config-parser.pm';

my %vm = (
    port => '',
    volume => '',
    cpus => '',
    mem => '',
);

my $conf = shift;

my %vm = &parse_config('vm', $conf);

my @opts = ();

push(@opts, join(" ", map { "--port " . $_ } split(/,/, $vm{'port'})));
push(@opts, join(" ", map { "--volume " . $_ } split(/,/, $vm{'volume'})));

if ($vm{'mem'}) {
    push(@opts, "--mem " . $vm{'mem'});
}

if ($vm{'cpus'}) {
    push(@opts, "--cpus " . $vm{'cpus'});
}

print join " ", @opts;

