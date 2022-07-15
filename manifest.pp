exec {
  "apt-get-update":
    command => "/usr/bin/apt-get update -y"
}

package {
  ["apache2"]:
    ensure  => installed,
    require => Exec["apt-get-update"]
}

service {
  "apache2":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package["apache2"]
}

file {
  "/var/www/html/index.html":
    source  => "/vagrant/index.html",
    owner   => "root",
    group   => "root",
    mode    => "0644",
    require => Package["apache2"],
    notify  => Service["apache2"]
}
