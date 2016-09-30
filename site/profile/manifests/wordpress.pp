class profile::wordpress {
  $installdir = '/var/www/html'
  $dbpassword = 'sdskjj93$*$kjs'
  
  user { 'wordpress':
 	  ensure => 'present',
  }

  class { ::wordpress:
    install_dir => "$installdir",
    wp_owner    => 'wordpress',
    wp_group    => 'wordpress',
    db_user     => 'wordpress',
    db_password => "$dbpassword",
  }
}
