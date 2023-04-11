#!/usr/bin/env perl
use strict;
use warnings;

use Test::More tests => 3;    # Indicate the number of tests you want to run
use File::Compare;

# The command line script to be tested
my $script = './pxf-validator';

##########
# TEST 1 #
##########
{
    # Input file for the command line script, if needed
    my $input_file = 't/mcahs1.json';

    # The reference file to compare the output with
    my $reference_file = 't/out_ok.txt';

    # The generated output file
    my $output_file = 't/out.txt';

    # Run the command line script with the input file, and redirect the output to the output_file
    system("$script -i $input_file -nc >  $output_file");

    # Compare the output_file and the reference_file
    ok(
        compare( $output_file, $reference_file ) == 0,
        qq/Output matches the <$reference_file> file/
    );

    # Cleanup the generated output file after testing
    unlink $output_file;
}
############
# TEST 2-3 #
############
{
    for my $i ( 1 .. 2 ) {

        # Input file for the command line script, if needed
        my $input_file = "t/mcahs1_err$i.json";

        # The reference file to compare the output with
        my $reference_file = "t/out_err$i.txt";

        # The generated output file
        my $output_file = 't/out.txt';

        # Run the command line script with the input file, and redirect the output to the output_file
        system("$script -i $input_file -nc >  $output_file");

        # Compare the output_file and the reference_file
        ok(
            compare( $output_file, $reference_file ) == 0,
            qq/Output matches the <$reference_file> file/
        );

        # Cleanup the generated output file after testing
        unlink $output_file;
    }
}
