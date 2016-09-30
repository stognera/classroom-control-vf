class profile::apache { 
  $docroot = '/var/www/html'
  $port = '8080'

  class { ::apache:
    mpm_module => 'prefork'
  }
  class {'::apache::mod::php': }
  
  class { ::apache:
    default_vhost => false,
  }
  
  ::apache::vhost { 'blog.example.com':
    port    => "$port",
    docroot => "$docroot",
    }
}
