use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Numbered::System::3';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Numbered::System)],
        short_description => 'system type C<3> system I<S> token',
        abstract => 'system type C<3> system I<S> token',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contans system type C<3> system I<S> token information.
EOF
    },
    attr_opt => [
    ],
    meth_opt => [
        {
            method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line for name
    my (\$number, \$remote_system_name, \$tail) = \$line =~ /\$USP_S3_RX/;
    defined(\$number) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    \$remote_system_name =~ s/\\s*\$//;
    my \@tail = \$self->_split_tail(\$tail);
    my \$acct = \$tail[0];
    my \$apass = \$tail[1];
    my \$upass = \$tail[2];
    my \$timeout = \$tail[4];
    my \$flags = \$tail[7];
    my \$exec = \$tail[8];

    # Set attributes
    \$self->set_number(\$number);
    defined(\$remote_system_name) && \$self->set_remote_system_name(\$remote_system_name);
    defined(\$acct) && \$self->set_acct(\$acct);
    defined(\$apass) && \$self->set_apass(\$apass);
    defined(\$upass) && \$self->set_upass(\$upass);
    defined(\$timeout) && \$self->set_timeout(\$timeout);
    defined(\$flags) && \$self->set_initially_open( \$flags =~ /i/i );
    defined(\$flags) && \$self->set_high_priority_login( \$flags =~ /h/i );
    require HH::Unispool::Config::ExecPri;
    defined(\$exec) && \$self->set_execution_priority( HH::Unispool::Config::ExecPri->new( {execution_priority=> \$exec} ) );
EOF
        },
        {
            method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    my \$flags = '';
    \$flags .= \$self->is_high_priority_login() ? 'H' : ' ';
    \$flags .= \$self->is_initially_open() ? 'I' : ' ';
    return(
        sprintf(
            \$USP_S3_FRM,
            \$self->get_number() || 0,
            \$self->get_remote_system_name() || '',
            \$self->get_acct() || '',
            \$self->get_apass() || '',
            \$self->get_upass() || '',
            \$self->get_timeout() || 0,
            \$flags || '',
            \$self->get_execution_priority()->get_execution_priority() || '',
        )
    );
EOF
        },
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::File::Token',
            import_list => [ 'qw( :rx :frm )' ],
        },
    ],
} );
