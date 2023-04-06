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

my $remote_port = $podman{'remote_port'};
if ($remote_port !~ /^\d+$/) {
    die "the remote_port is not specified";
}



my @env = ();

push(@env, "export CONTAINER_HOST=tcp://127.0.0.1:$remote_port");

if ($podman{'use_docker'}) {
    push(@env, "export DOCKER_HOST=tcp://127.0.0.1:$remote_port");
    push(@env, "export DOCKER_BUILDKIT=0");
}

push(@env,
      "# You need exec the following command to use podman:\n"
    . '# eval $(krunpod podman-env)'
);

print join("\n", @env) . "\n";
