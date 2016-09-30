class profile::mysql {
  $strongpassword = hiera(mysql::rootpassword)
  
  include mysql::bindings::php
  
  class { '::mysql::server':
    root_password           => "$strongpassword",
  }
}
