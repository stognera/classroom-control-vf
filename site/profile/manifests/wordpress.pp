class profile::wordpress {
  $installdir = '/var/www/html'
  $dbpassword = 'sdskjj93$*$kjs'
  $user = 'wordpress'
  
    File {
    owner => $user,
    group => $user,
    mode  => '0644',
  }
  
  user { "$user":
 	  ensure => 'present',
  }
  
  file { $installdir:
    ensure  => directory,
  }

  class { ::wordpress:
    install_dir => "$installdir",
    wp_owner    => 'wordpress',
    wp_group    => 'wordpress',
    db_user     => 'wordpress',
    db_password => "$dbpassword",
  }
}
