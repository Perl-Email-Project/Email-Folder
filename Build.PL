use strict;
use Module::Build;

Module::Build->new(
    module_name => "Email::Folder",
    license     => 'perl',
    requires    => {
        'Test::More' => 0,
        'Email::Simple' => 0,
        'Email::FolderType' => 0.6, # for Ezmlm
    },
    create_makefile_pl => 'traditional',
   )
  ->create_build_script;
