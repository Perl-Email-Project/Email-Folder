use strict;
use warnings;
package Email::Folder::MH;
# ABSTRACT: reads raw RFC822 mails from an mh folder
use Carp;
use IO::File;
use Email::Folder::Reader;
use parent 'Email::Folder::Reader';

=head1 SYNOPSIS

This isa Email::Folder::Reader - read about its API there.

=head1 DESCRIPTION

It's yet another email folder reader!  It reads MH folders.

=cut

sub _what_is_there {
    my $self = shift;
    my $dir = $self->{_file};

    croak "$dir does not exist"     unless (-e $dir);
    croak "$dir is not a directory" unless (-d $dir);

    my @messages;
                opendir(DIR,"$dir") or croak "Could not open '$dir'";
                foreach my $file (readdir DIR) {
                        next unless $file =~ /\A\d+\Z/;
                                push @messages, "$dir/$file";
                }

    $self->{_messages} = \@messages;
}

sub next_message {
    my $self = shift;
    my $what = $self->{_messages} || $self->_what_is_there;

    my $file = shift @$what or return;
    local *FILE;
    open FILE, $file or croak "couldn't open '$file' for reading";
    join '', <FILE>;
}

1;
