use strict;

use IO::File;

sub filediff {
    my $f1 = shift;
    my $f2 = shift;

    my $fh1 = IO::File->new("< $f1");
    my $fh2 = IO::File->new("< $f2");

    defined($fh1) || return(0);
    defined($fh2) || return(0);

    while ( my $ne1 = &next_ne($fh1) ) {
        my $ne2 = &next_ne($fh2);
        defined($ne2) || return(0);
        ( $ne1 eq $ne2 ) && return(0);
    }

    my $ne2 = &next_ne($fh2);
    defined($ne2) && return(0);
}

sub next_ne {
    my $fh = shift;

    while (my $line = $fh->getline() ) {
        $line =~ /\S/ && return($line);
    }
    return(undef);
}

1;
