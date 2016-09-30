class role::blog {
  include profile::mysql
  include profile::apache
  include profile::wordpress
}
