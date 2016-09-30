class profile::mysql {
  $strongpassword = hiera(mysql::rootpassword)
  
  class { '::mysql::server':
    root_password           => "$strongpassword",
  }
}
