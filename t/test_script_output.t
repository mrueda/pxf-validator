#!/usr/bin/env perl
use strict;
use warnings;

use Test::More tests => 1; # Indicate the number of tests you want to run
use File::Compare;

# The command line script to be tested
my $script = './pxf-validator';

# Input file for the command line script, if needed
my $input_file = 't/mcahs1.json';

##########
# TEST 1 #
##########

# The reference file to compare the output with
my $reference_file = 't/out_ok.txt';

# The generated output file
my $output_file = 't/out.txt';

# Run the command line script with the input file, and redirect the output to the output_file
system("$script -i $input_file >  $output_file");

# Compare the output_file and the reference_file
ok( compare( $output_file, $reference_file ) == 0,  qq/Output matches the <$reference_file> file/);

# Cleanup the generated output file after testing
unlink $output_file;
