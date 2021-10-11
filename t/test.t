#!/usr/bin/env perl

# Copyright © 2021 Jakub Wilk <jwilk@jwilk.net>
# SPDX-License-Identifier: MIT

use v5.10;

use strict;
use warnings;

use English qw(-no_match_vars);
use autodie qw(open close);

use Test::More tests => 5;

use IPC::System::Simple qw(capture);

my $guard_var = 'SKEPTICA_TEST_NETWORK';
if (not $ENV{$guard_var}) {
    BAIL_OUT("\$$guard_var is not set.");
}

my $prog = $PROGRAM_NAME;
my $base = ($prog =~ s{/?[^/]+\z}{}r) . '/..';
open (my $fh, '<', "$base/README");
my %urls;
while (<$fh>) {
    if (m{(\w+://[^\s/<>]++)([^\s<>]++)}) {
        $urls{$1} = "$1$2";
    }
}
close($fh);
my @urls = sort values %urls;
my @out = capture("$base/skeptica", @urls);
cmp_ok(scalar @out, '==', scalar @urls, 'output length');
my $cadir = '/usr/share/ca-certificates/mozilla';
for my $i (0..$#urls) {
    my $url = $urls[$i];
    my $line = $out[$i];
    diag($line);
    like($line, qr{\A$url\Q\E\t\Q$cadir\E/[\w.-]+[.]crt\n}, $url);
}

# vim:ts=4 sts=4 sw=4 et
