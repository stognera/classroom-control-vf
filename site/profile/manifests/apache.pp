class profile::apache { 
  $docroot = '/var/www/html'
  $port = '8080'

  class { ::apache:
    mpm_module    => 'prefork',
    default_vhost => false,
  }
  
  class { ::apache::mod::proxy }

  ::apache::vhost { 'blog.example.com':
    port    => "$port",
    docroot => "$docroot",
    }
}

