class profile::apache { 
  class { '::apache:
    mpm_module => 'prefork'
  }
  class {'::apache::mod::php': }
}
