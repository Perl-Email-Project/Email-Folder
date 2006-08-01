use ExtUtils::MakeMaker;
use strict;
use warnings;

WriteMakefile(
  NAME          => 'Email::Folder',
  VERSION_FROM  => 'lib/Email/Folder.pm',
  PREREQ_PM     => {
    'Email::FolderType' => 0.6, # or Ezmlm
    'Email::Simple' => 0,
    'Test::More'    => '0.47',
  },
);

