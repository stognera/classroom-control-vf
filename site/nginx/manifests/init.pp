class nginx (
  $root = undef,
){
  case $::osfamily{
    'redhat','debian':{
      $package = 'nginx'
      $owner = 'root'
      $group = 'root'
      $rootnotdefined = '/var/www'
      $confdir = '/etc/nginx'
      $logdir = '/var/log/nginx'
    }
    'windows':{
      $package = 'nginx-service'
      $owner = 'Administrator'
      $group = 'Administrators'
      $rootnotdefined = 'C:/ProgramData/nginx/html'
      $confdir = 'C:/ProgramData/nginx'
      $logdir = 'C:/ProgramData/nginx/logs'
    }
    default :{
      fail("Module ${module_name} is not supported on ${::osfamily}")
    }
  }
  
  $user = $::osfamily ? {
    'redhat' => 'nginx',
    'debian' => 'www-data',
    'windows' => 'nobody',
  }  
  
  $docroot = $root ? {
    undef   => $rootnotdefined,
    default => $root,
  }
    
  File {
    owner => $owner,
    group => $group,
    mode  => '0644',
  }
  
  package { $package:
    ensure => present,
  }

  file { "${confdir}/nginx.conf":
    ensure  => file,
    content => epp('nginx/nginx.conf.epp',
            {
              user => $user,
              confdir => $confdir,
              logdir => $logdir,
            }),
    notify => Service['nginx'],
  }

  file { "${confdir}/conf.d/default.conf":
    ensure  => file,
    content => epp('nginx/default.conf.epp',
            {
              docroot => $docroot,
            }),
    notify => Service['nginx'],
  }
  
    file { "${docroot}/index.html":
    ensure  => file,
    source  => 'puppet:///modules/nginx/index.html',
  }
  
    file { [$docroot, "${confdir}/conf.d"]:
    ensure  => directory,
  }

  service { 'nginx':
    ensure    => running,
    enable    => true,
    subscribe => File[
                   '/etc/nginx/nginx.conf',
                   '/etc/nginx/conf.d/default.conf'
                 ],
  }
}
