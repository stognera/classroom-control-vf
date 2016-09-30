class profile::apache { 
  class { ::apache:
    mpm_module => 'prefork',
    port    => '8080'
  }
  class {'::apache::mod::php': }

