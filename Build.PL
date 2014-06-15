use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    name                => 'Devel-ModInfo',
    module_name         => 'Devel::ModInfo',
    license             => 'perl',
    dist_author         => 'Dai Okabayashi <bayashi@cpan.org>',
    dist_version_from   => 'lib/Devel/ModInfo.pm',
    configure_requires  => {
        'Module::Build' => 0.38,
    },
    build_requires      => {
        'Test::More' => 0.88,
        'Capture::Tiny' => 0,
    },
    requires => {
        'perl' => '5.008001',
    },
    add_to_cleanup      => [ 'Devel-ModInfo-*' ],
    meta_merge     => {
      resources => {
        repository  => 'http://github.com/bayashi/Devel-ModInfo',
        bugtracker  => 'http://github.com/bayashi/Devel-ModInfo/issues',
      }
    },
    recursive_test_files => 1,
    test_files => (-d '.git' || $ENV{RELEASE_TESTING}) ? ['t/', 'xt/'] : ['t/'],
);

$builder->create_build_script();
