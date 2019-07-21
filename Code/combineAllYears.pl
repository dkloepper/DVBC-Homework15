#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

my $data_dir = 'C:/Users/dkloe/OneDrive/Documents/Data Viz Bootcamp/Homework 15/Data/Unzipped/';
my $output_dir = "C:/Users/dkloe/OneDrive/Documents/Data Viz Bootcamp/Homework 15/Data/Source/2017-2019combined.csv";

opendir my $dh, "$data_dir";

open my $outfh, ">>", $output_dir;
my $seenheader = 0;

while (my $file = readdir $dh) {
    next unless $file =~ /combined\.csv$/;

    open my $infh, '<', "$data_dir/$file";

    while (<$infh>) {
        print $outfh $_ if $. > 1 || ! $seenheader++;
    }
    close $infh;

}