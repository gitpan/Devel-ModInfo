use strict;
use warnings;
use Devel::ModInfo;
use Test::More;
use Capture::Tiny qw/capture_stdout/;

{
    my $stdout = capture_stdout { print Devel::ModInfo::show(); };

    like $stdout, qr/^Perl\t\d+/;
    like $stdout, qr/Test::More\t\d+/;
    like $stdout, qr/Capture::Tiny\t\d+/;

    if ($ENV{AUTHOR_TEST}) { note "1st:\n". $stdout; }
}

{
    my $stdout = capture_stdout { print Devel::ModInfo::show(); };

    is   $stdout, '';
    isnt $stdout, undef;

    if ($ENV{AUTHOR_TEST}) { note "2nd:\n". $stdout; }
}

{
    $Devel::ModInfo::SHOWN = 0; # reset flag

    my $stdout = capture_stdout { print Devel::ModInfo::show(); };

    like $stdout, qr/^Perl\t\d+/;
    like $stdout, qr/Test::More\t\d+/;
    like $stdout, qr/Capture::Tiny\t\d+/;

    if ($ENV{AUTHOR_TEST}) { note "3rd:\n". $stdout; }
}

done_testing;
