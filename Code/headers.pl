#!/usr/bin/env perl
use strict;
use warnings;
use autodie;


#Retrive just the head rows from each file and print to file for purposes of comparison

my $data_dir = 'C:/Users/dkloe/OneDrive/Documents/Data Viz Bootcamp/Homework 15/Data/Unzipped/';
my $output_dir = "C:/Users/dkloe/OneDrive/Documents/Data Viz Bootcamp/Homework 15/Data/Source/headers.csv";

opendir my $dh, "$data_dir";

open my $outfh, ">>", $output_dir;
my $seenheader = 0;

while (my $file = readdir $dh) {
    next unless $file =~ /\.csv$/;

    open my $infh, '<', "$data_dir/$file";
    my $firstLine = <$infh>; 
    print $outfh "$file,$firstLine";
    close $infh;
    # while (<$infh>) {
    #     print $outfh $_ if $. > 1 || ! $seenheader++;
    # }

}