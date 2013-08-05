use strict;
use warnings;
package Email::Folder::Reader;
# ABSTRACT: reads raw RFC822 mails from a box
use Carp;

=head1 SYNOPSIS

 use Email::Folder::Reader;
 my $box = Email::Folder::Reader->new('somebox');
 print $box->messages;

or, as an iterator

 use Email::Folder::Reader;
 my $box = Email::Folder::Reader->new('somebox');
 while ( my $mail = $box->next_message ) {
     print $mail;
 }

=head1 METHODS

=head2 new($filename, %options)

your standard class-method constructor

=cut

sub new {
    my $class = shift;
    my $file  = shift || croak "You must pass a filename";
    bless { eval { $class->defaults },
            @_,
            _file => $file }, $class;
}

=head2 ->next_message

returns the next message from the box, or false if there are no more

=cut

sub next_message {
}

=head2 ->messages

Returns all the messages in a box

=cut

sub messages {
    my $self = shift;

    my @messages;
    while (my $message = $self->next_message) {
        push @messages, $message;
    }
    return @messages;
}

1;
