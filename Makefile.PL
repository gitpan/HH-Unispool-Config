use 5.006;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my ($VERSION) = '$Revision: 0.3 $' =~ /\$Revision:\s+([^\s]+)/;

WriteMakefile(
    
    NAME     => 'HH::Unispool::Config',
    VERSION  => $VERSION,
    PREREQ_PM => {
        Error => 0,
    },
    (
        $] >= 5.005 ?    ## Add these new keywords supported since 5.005
        (
            ABSTRACT => 'HollandHouse\' UNISPOOL configuration',
            AUTHOR   => 'Vincenzo Zocca <Vincenzo@zocca.do.not.sPam.com>'
        ) : ()
    ),
    clean => {
        FILES => 'gen/tmp diff-all pod-all sdiff-all t/*.out',
    },
);
