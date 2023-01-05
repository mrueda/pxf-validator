# NAME

pxf-validator: A script that validates PXF JSON files against PXF v2 JSON schema.

# SYNOPSIS

pxf-validator -i <\*json> \[-options\]

     Arguments:                       
       -i|input                       Phenopacket JSON file(s)

     Options:
       -s|schema-dir                  Directory with Phenopacket v2 JSON schema 
       -h|help                        Brief help message
       -man                           Full documentation
       -debug                         Print debugging (from 1 to 5, being 5 max)
       -verbose                       Verbosity on
       -nc|-no-color                  Don't print colors to STDOUT

# DESCRIPTION

pxf-validator: A script that validates PXF JSON files against PXF v2 JSON schema.

# SUMMARY

pxf-validator: A script that validates PXF JSON files against PXF v2 JSON schema.

# INSTALLATION

## Containerized

Please download the `Dockerfile` from the repo:

    wget https://raw.githubusercontent.com/mrueda/pxf-validator/main/Dockerfile

And then run:

    docker build -t cnag/pxf-validator:latest .

To run the container (detached) execute:

    docker run -tid --name pxf-validator cnag/pxf-validator:latest

To enter:

    docker exec -ti pxf-validator bash

The command-line executable can be found at:

     /usr/share/pxf-validator/pxf-validator
    

### Mounting volumes
Docker containers are fully isolated. If you need the mount a volume to the container please use the following syntax (`-v host:container`). 
Find an example below (note that you need to change the paths to match yours):

    docker run -tid --volume /media/mrueda/4TBT/data:/data --name pxf-validator-mount cnag/pxf-validator:latest

Then I will do something like this:

    # First I create an alias to simplify invocation (from the host)
    alias pxf-validator='docker exec -ti pxf-validator-mount /usr/share/pxf-validator/pxf-validator'

    # Now I use the alias to run the command (note that I use the flag --out-dir to specify the output directory)
    convert-pheno -i pxf.json

## Non containerized

The script runs on command-line Linux and it has been tested on Debian/RedHat based distributions (only showing commands for Debian's). Perl 5 is installed by default on Linux, 
but we will install a few CPAN modules with `cpanminus`.

    git clone https://github.com/mrueda/pxf-validator.git
    cd pxf-validator

Now you have two choose between one of the 2 options below:

**Option 1:** Install dependencies (they're harmless to your system) as `sudo`:

    make install # (Will ask for sudo passwd)

**Option 2:** Install the dependencies in a "virtual environment" (i.e., install the CPAN modules in the directory of the application). We'll be using with the module `Carton`:

    make install-carton

### System requirements

    * Ideally a Debian-based distribution (Ubuntu or Mint), but any other (e.g., CentOs, OpenSuse) should do as well.
    * Perl 5 (>= 5.10 core; installed by default in most Linux distributions). Check the version with "perl -v"
    * 500MB of RAM.
    * 1 core (it only uses one core per job).
    * At least 1GB HDD.

# HOW TO RUN PXF-VALIDATOR

For executing pxf-validator you will need:

- Input file(s):

    A Phenopacket file(s) in JSON format.

**Examples:**

    $ pxf-validator -i phenopackets.json 

    $ $path/pxf-validator -i phenopackets*.json

    $ carton exec -- $path/pxf-validator -i phenopackets.json # If using Carton

## COMMON ERRORS AND SOLUTIONS

The validator is based on JSON Schema, thus, **the validation is only as good as the artificially-created JSON schema**.

    * NB: Phenopackets v2 does not allow for additional properties at the root level. Required properties: [ "id", "metaData" ].
          At the 2nd level, "metaData" does not allow for additional properties.

    * Error message: Foo
      Solution: Bar

    * Error message: Foo
      Solution: Bar

# AUTHOR 

Written by Manuel Rueda, PhD. Info about CNAG can be found at [https://www.cnag.crg.eu](https://www.cnag.crg.eu).

# COPYRIGHT AND LICENSE

This PERL file is copyrighted. See the LICENSE file included in this distribution.
