#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

#Combine all 2019 monthly files into a single file

my $data_dir = 'C:/Users/dkloe/OneDrive/Documents/Data Viz Bootcamp/Homework 15/Data/Unzipped/';
my $output_dir = "C:/Users/dkloe/OneDrive/Documents/Data Viz Bootcamp/Homework 15/Data/Source/2019combined.csv";

opendir my $dh, "$data_dir";

open my $outfh, ">>", $output_dir;
my $seenheader = 0;

while (my $file = readdir $dh) {
    next unless $file =~ /^2019.+\.csv$/;

    open my $infh, '<', "$data_dir/$file";

    while (<$infh>) {
        $_ =~ s/\.[0-9]{4}\"/\"/g;
        print $outfh $_ if $. > 1 || ! $seenheader++;
    }
    close $infh;

}