use strict;

my $pkg = 'HH::Unispool::Config::Entry::Device::3';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry::Device) ],
        short_description => 'UNISPOOL type 3 device',
        abstract => 'UNISPOOL type 3 device',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_Device_3.pl', '.'),
        description => <<EOF,
Class C<${pkg}> holds information for UNISPOOL type 3 device
EOF
    },
    attr_opt => [
        {
            attribute_name => 'networkwide',
            type => 'BOOLEAN',
            default_value => 1,
            short_description => 'the device must be made available from each node in the configuration cluster',
        },
        {
            attribute_name => 'initially_spooled',
            type => 'BOOLEAN',
            default_value => 1,
            short_description => 'an automatic STARTSPOOL must be performed when UNISPOOL is started',
        },
        {
            attribute_name => 'execution_priority',
            allow_isa => [ qw(HH::Unispool::Config::ExecPri) ],
            short_description => 'the execution priority of the driver process on MPE hosts',
            default_value => 'HH::Unispool::Config::ExecPri->new( { execution_priority => \'\' } )',
        },
        {
            attribute_name => 'member_device_name',
            type => 'MULTI',
            unique => 1,
            allow_rx => [ qw(^\w+$) ],
            short_description => 'the list of names of the devices that can be accessed through the group device',
        },
    ],
    constr_opt => [
        {
            method_name => 'new_from_tokenizer',
        },
    ],
    meth_opt => [
        {
            method_name => 'add_members_from_tokenizer',
            parameter_description => 'TOKENIZER',
            short_description => 'write the C<G> lines for the device',
            description => <<EOF,
Adds group members to using tokens. C<TOKENIZER> is an C<HH::Unispool::Config::File::Tokenizer> reference. On error an exception C<Error::Simple> is thrown.
EOF
        },
        {
            method_name => 'diff',
        },  
        {
            method_name => 'write_group',
            parameter_description => 'FILE_HANDLE',
            short_description => 'write the C<G> lines for the device',
            description => <<EOF,
Writes the group members of the entry to the specified file handle. C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.
EOF
            body => <<EOF,
EOF
        },
        {
            method_name => 'write',
            description => <<EOF,
Writes the entry to the specified file handle, omitting the group members (see L<write_group()>). C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.
EOF
        },
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::ExecPri',
        },
    ],
} );
