#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

#Combine all 2017 monthly files into a single file

my $data_dir = 'C:/Users/dkloe/OneDrive/Documents/Data Viz Bootcamp/Homework 15/Data/Unzipped/';
my $output_dir = "C:/Users/dkloe/OneDrive/Documents/Data Viz Bootcamp/Homework 15/Data/Source/2017combined.csv";

opendir my $dh, "$data_dir";

open my $outfh, ">>", $output_dir;
my $seenheader = 1;

my $header = "tripduration,starttime,stoptime,start station id,start station name,start station latitude,start station longitude,end station id,end station name,end station latitude,end station longitude,bikeid,usertype,birth year,gender";
print $outfh $header;

while (my $file = readdir $dh) {
    next unless $file =~ /^2017.+\.csv$/;

    open my $infh, '<', "$data_dir/$file";

    while (<$infh>) {

        print $outfh $_ if $. > 1 || ! $seenheader++;
    }
    close $infh;

}