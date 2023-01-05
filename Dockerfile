#FROM ubuntu
FROM perl:5.36-bullseye

# File Author / Maintainer
MAINTAINER Manuel Rueda <manuel.rueda@cnag.crg.eu>

# Install Linux tools
RUN apt-get update && \
    apt-get -y install gcc unzip make git cpanminus perl-doc vim sudo libperl-dev

# Download Convert-Pheno
WORKDIR /usr/share/
RUN git clone https://github.com/mrueda/pxf-validator.git

# Install Perl modules
WORKDIR /usr/share/pxf-validator
RUN cpanm --installdeps .
