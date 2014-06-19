package Book;

use Digest::MD5;	
use strict;

##
## Book->new('reference|fiction','some title')
##
sub new {
	my ($class,$type,$title) = @_;

	my $self = {};
	$self->{'id'} = Digest::MD5::md5_hex($title);
	$self->{'type'} = $type;	
	$self->{'title'} = $title;
	$self->{'onshelf'} = 1;

	bless $self, 'Book';
	return($self);
	}

##
## purpose: tries to checkout a book
## returns id + status
##			  undef + message on failure
##
sub checkout {
	my ($self) = @_;
	if (not $self->{'onshelf'}) { return(undef,"Not onshelf"); }
	if ($self->{'type'} eq 'reference') { return(undef,"Sorry, reference books cannot be checked out, please use the photocopier in the library"); }
	$self->{'onshelf'} = 0;
	return($self->{'id'},'success');	
	}

sub returnit { my ($self) = @_; $self->{'onshelf'}++; }


## some utility functions
sub title { return($_[0]->{'title'}); }
sub id { return($_[0]->{'id'}); }
sub type { return($_[0]->{'type'}); }

sub is_onshelf {
	my ($self) = @_;
	return($self->{'onshelf'});
	}

1;

