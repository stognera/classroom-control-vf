class nginx {
  package { 'nginx':
    ensure => present,
  }

  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    source  => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
  }
  
    file { '/etc/nginx/conf.d/default.conf':
    ensure  => file,
    source  => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
  }

  service { 'memcached':
    ensure    => nginx,
    enable    => true,
    subscribe => [
                 File['/etc/nginx/nginx.conf'],
                 File['/etc/nginx/conf.d/default.conf'],
                 ],
  }
}
