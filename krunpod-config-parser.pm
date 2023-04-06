use strict;
use warnings;
use utf8;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';


sub parse_config {
    my ($key, $conf) = @_;
    my %ret = ();

    open(my $fh, '<', $conf) or die "cannot open [$conf]";

    while (<$fh>) {
        next if (/^\s*#/);

        if (/\[$key\]/.../^\s*\[/ and /\s*(\S+)\s*=\s*(\S+)\s*$/) {
            $ret{$1} = $2;
        }
    }

    return %ret;
}

1;
