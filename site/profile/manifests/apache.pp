class profile::apache { 
  $docroot = hiera(apache::docroot)
  $port = hiera(apache::port)

  class { ::apache:
    mpm_module    => 'prefork',
    default_vhost => false,
  }
  
  include apache::mod::php 

  ::apache::vhost { 'blog.example.com':
    port    => "$port",
    docroot => "$docroot",
    }
}

