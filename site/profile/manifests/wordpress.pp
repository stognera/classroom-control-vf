class profile::wordpress {

  $installdir = hiera(wordpress::installdir)
  $dbpassword = hiera(wordpress::dbpassword)
  $user = heira(wordpress::user)
  
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
