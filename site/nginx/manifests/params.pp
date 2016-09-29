class nginx::params {
  case $::osfamily {
    'redhat': {
      $package = 'nginx'
      $owner = 'root'
      $group = 'root'
      $confdir = '/etc/nginx'
      $logdir = '/var/log/nginx'
      $user = 'nginx'
      $docroot = '/var/www'
    }
    'debian': {
      $package = 'nginx'
      $owner = 'root'
      $group = 'root'
      $confdir = '/etc/nginx'
      $logdir = '/var/log/nginx'
      $user = 'www-data'
      $docroot = '/var/www'
    }
    'windows': {
      $package = 'nginx-service'
      $owner = 'Administrator'
      $group = 'Administrators'
      $confdir = 'C:/ProgramData/nginx'
      $logdir = 'C:/ProgramData/nginx/logs'
      $user = 'nobody'
      $docroot = 'C:/ProgramData/nginx/html'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::osfamily}")
    }
  }
}
