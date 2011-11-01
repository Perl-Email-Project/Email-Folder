use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME          => 'Email::Folder',
  VERSION_FROM  => 'lib/Email/Folder.pm',
  (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM     => {
    'Email::FolderType' => 0.6, # or Ezmlm
    'Email::Simple' => 0,
    'Test::More'    => '0.47',
    'IO::Uncompress::Gunzip' => 0,
  },
);

