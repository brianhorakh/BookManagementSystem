#!/usr/bin/perl

use lib ".";
use Book;
use Data::Dumper;


 
my @SHELVES = ();
while (<DATA>) {
	chomp($_);
	my ($type,$title) = split(/\|/,$_);
	push @SHELVES, Book->new($type,$title);
	}

## here's a list of shelves
foreach my $book (@SHELVES) {
	print sprintf("%s\t%s\n",$book->title(),$book->type());
	}

## lets craete and then checkout a reference title
my $b1 = Book->new("reference","reference title");
print Dumper($b1->checkout());

## now how about a fiction title
my $b2 = Book->new("fiction","fiction title");
print Dumper($b2->checkout());	## now check it out
print Dumper($b2->checkout());	## this will fail!
print Dumper($b2->returnit());	## now lets put it back
print Dumper($b2->checkout());	## yay, this wwill work!

1;



__DATA__
fiction|my fiction book
reference|learning perl
reference|applied cryptography
