use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Comment::Date';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Comment)],
        short_description => 'date comment token',
        abstract => 'date comment token',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contains information on the date comment token.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'time',
             allow_rx => [ qw(^\d+$) ],
             default_value => 0,
             allow_empty => 0,
             short_description => 'the date in the comment in Unix time',
        },
    ],
    meth_opt => [
        {
            method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line
    my (\$mon, \$mday, \$year, \$hour, \$min, \$am_pm) = \$line =~ /\$USP_DATE_RX/;
    defined(\$mon) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");

    # Make Unix time out of obtained values
    if ( \$am_pm =~ /am/i && \$hour == 12 ) {
        \$hour = 0;
    }
    elsif ( \$am_pm =~ /pm/i && \$hour < 12 ) {
        \$hour += 12;
    }
    \$mon = \$USP2UNIX_MONTH{ lc(\$mon) };
    my \$time = timelocal ( 0, \$min, \$hour, \$mday, \$mon, \$year - 1900 );

    # Set attributes
    \$self->set_time(\$time);
EOF
        },
        {
            method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    my \@time = localtime( \$self->get_time() );
    my \$am_pm = (\$time[2] < 12) ? 'AM' : 'PM';
    my \$hour12 = \$time[2];
    if ( \$time[2] == 0 ) {
        \$hour12 = 12;
    }
    elsif ( \$time[2] > 12 ) {
        \$hour12 = \$time[2] - 12;
    }
    return(
        sprintf(
            \$USP_DATE_FRM,
            \$UNIX2USP_WDAY[ \$time[6] ] || '',
            \$UNIX2USP_MONTH{ \$time[4] } || '',
            \$time[3] || 0,
            \$time[5] + 1900 || 0,
            \$hour12 || 0,
            \$time[1] || 0,
            \$am_pm || 0,
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
        {
            dependency_name => 'Time::Local',
            import_list => [ 'qw( timelocal )' ],
        },
    ],
    sym_opt => [
        {
            symbol_name => '@UNIX2USP_WDAY',
            assignment => <<'EOF',
qw( SUN MON TUE WED THU FRI SAT );
EOF
            comment => "# Unispool <=> unix conversion\n",
        },
        {
            symbol_name => '%UNIX2USP_MONTH',
            assignment => <<'EOF',
();
EOF
            comment => "# Unispool <=> unix conversion\n",
        },
        {
            symbol_name => '%USP2UNIX_MONTH',
            assignment => <<'EOF',
(
    jan => 0,
    feb => 1,
    mar => 2,
    apr => 3,
    may => 4,
    jun => 5,
    jul => 6,
    aug => 7,
    sep => 8,
    oct => 9,
    nov => 10,
    dec => 11,
);
EOF
            comment => "# Unispool <=> unix conversion\n",
        },
    ],
} );
