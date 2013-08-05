use strict;
use warnings;
package Email::Folder::Ezmlm;
# ABSTRACT: reads raw RFC822 mails from an ezmlm archive
use Carp;
use Email::Folder::Maildir;
use parent 'Email::Folder::Maildir';

# we're a little complicit, just redefining an internal method, but
# that's fine, we maintain both piles :)

sub _what_is_there {
    my $self = shift;
    my $dir = $self->{_file};

    croak "$dir does not exist"           unless (-e $dir);
    croak "$dir is not an ezmlm archive"  unless (-d $dir);
    croak "$dir is not an ezmlm archive"  unless (-e "$dir/archive" && -d "$dir/archive");

    my $num;
    if (my $fh = IO::File->new("$dir/num")) {
        ($num) = (<$fh> =~ m/^(\d+)/);
    }

    $self->{_messages} = [ map {
        sprintf '%s/archive/%d/%02d', $dir, int $_ / 100, $_ % 100
    } 1..$num ];
}

1;
