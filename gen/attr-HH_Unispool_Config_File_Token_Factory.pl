use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Factory';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        short_description => 'token factory class',
        abstract => 'token factory class',
        singleton => 1,
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contains factory method to make tokens out of strings.
EOF
    },
    attr_opt => [
    ],
    meth_opt => [
        {
            method_name => 'create_token',
            parameter_description => ' LINE[, NR ] ',
            description => <<EOF,
Creates a C<HH::Unispool::Config::File::Token> object out of the specified line. C<LINE> is a plain line string. C<NR> is an optional parameter containing the line number from where the line is read. On error an exception C<Error::Simple> is thrown.
EOF
            body => <<'EOF',
    my $self = shift;
    my $line = shift;
    my $nr = shift;

    # Look for a matching regular expression
    if ( $line =~ $USP_BCS_RX ) {
        require HH::Unispool::Config::File::Token::Unnumbered::Bcs;
        my $tok = HH::Unispool::Config::File::Token::Unnumbered::Bcs->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_CFG_DEV_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Device;
        my $tok = HH::Unispool::Config::File::Token::Comment::Device->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_CFG_GRP_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Group;
        my $tok = HH::Unispool::Config::File::Token::Comment::Group->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_CFG_MISC_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Misc;
        my $tok = HH::Unispool::Config::File::Token::Comment::Misc->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_CFG_RSYS_RX ) {
        require HH::Unispool::Config::File::Token::Comment::RSys;
        my $tok = HH::Unispool::Config::File::Token::Comment::RSys->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_CS_INFO_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Cs;
        my $tok = HH::Unispool::Config::File::Token::Comment::Cs->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_CS_RX ) {
        require HH::Unispool::Config::File::Token::Unnumbered::Cs;
        my $tok = HH::Unispool::Config::File::Token::Unnumbered::Cs->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D0_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::0;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::0->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D1_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::1;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::1->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D2_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::2;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::2->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D3_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::3;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::3->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D4_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::4;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::4->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D5_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::5;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::5->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D6_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::6;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::6->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D7_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::7;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::7->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_DATE_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Date;
        my $tok = HH::Unispool::Config::File::Token::Comment::Date->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_FILTER_INFO_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Filter;
        my $tok = HH::Unispool::Config::File::Token::Comment::Filter->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_FILTER_RX ) {
        require HH::Unispool::Config::File::Token::Unnumbered::Filter;
        my $tok = HH::Unispool::Config::File::Token::Unnumbered::Filter->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_G_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::Group;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::Group->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_H_RX ) {
        require HH::Unispool::Config::File::Token::Unnumbered::Host;
        my $tok = HH::Unispool::Config::File::Token::Unnumbered::Host->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_HEAD_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Head;
        my $tok = HH::Unispool::Config::File::Token::Comment::Head->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_ID_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::Info;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::Info->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_IS_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::System::Info;
        my $tok = HH::Unispool::Config::File::Token::Numbered::System::Info->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_L_RX ) {
        require HH::Unispool::Config::File::Token::Unnumbered::CSN;
        my $tok = HH::Unispool::Config::File::Token::Unnumbered::CSN->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_M_RX ) {
        require HH::Unispool::Config::File::Token::Unnumbered::Misc;
        my $tok = HH::Unispool::Config::File::Token::Unnumbered::Misc->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_N_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Network;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Network->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_PD_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::P;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::P->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_S3_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::System::3;
        my $tok = HH::Unispool::Config::File::Token::Numbered::System::3->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_S6_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::System::6;
        my $tok = HH::Unispool::Config::File::Token::Numbered::System::6->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_S7_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::System::7;
        my $tok = HH::Unispool::Config::File::Token::Numbered::System::7->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_S8_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::System::8;
        my $tok = HH::Unispool::Config::File::Token::Numbered::System::8->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_SCOPE_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Scope;
        my $tok = HH::Unispool::Config::File::Token::Comment::Scope->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_TAIL_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Tail;
        my $tok = HH::Unispool::Config::File::Token::Comment::Tail->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_X_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::X;
        my $tok = HH::Unispool::Config::File::Token::Numbered::X->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    else {
        chomp($line);
        my $nrmsg = ($nr) ? " read from line number '$nr'" : '';
        throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::factory::create_token, specified line '$line'$nrmsg does not match any token pattern.");
    }
EOF
        },
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::File::Token',
            import_list => [ 'qw( :rx )' ],
        },
    ],
} );
