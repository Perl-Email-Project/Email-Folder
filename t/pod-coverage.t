#!perl -T

use Test::More;

plan skip_all => 'set RELEASE_TESTING to test pod' if ! $ENV{RELEASE_TESTING};

eval "use Test::Pod::Coverage 1.08";
plan skip_all => "Test::Pod::Coverage 1.08 required for testing POD coverage"
  if $@;

all_pod_coverage_ok({
  coverage_class => 'Pod::Coverage::CountParents',
  also_private   => [ qw(defaults) ],
});
