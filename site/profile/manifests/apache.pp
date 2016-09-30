class profile::apache { 
  class { ::apache:
    mpm_module => 'prefork'

  class {'::apache::mod::php': }
  
  apache::vhost { 'blog.example.com':
    port    => '8080',
    docroot => '/var/www/html',
  }
}
