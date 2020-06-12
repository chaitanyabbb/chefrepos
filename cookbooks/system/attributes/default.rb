default[:system][:shells]                                      = { 'bash' => '/bin/bash',
                                                                   'sh'   => '/bin/sh',
                                                                   'dash' => '/bin/dash' }
default[:system][:osmounts]                                    = { 'slash' => '/dev/mapper/centos-root    /                       xfs    defaults        1 1',
                                                                   'boot'  => 'LABEL=boot                 /boot                   xfs    defaults        1 2',
                                                                   'swap'  => '/dev/mapper/centos-swap    swap                    swap   defaults        0 0' }
default[:system][:mounts]                                      = { }
default[:system][:exports]                                     = { }
default[:system][:hosts]                                       = { }
default[:system][:dns_search]                                  = 'mylab.local'
default[:system][:dns_options]                                 = 'timeout:1'
default[:system][:dns_resolvers]                               = { 'ns1' => '192.168.202.53',
                                                                   'ns2' => '192.168.0.1' }
default[:system][:hardened][:login_defs]                       = true
default[:system][:hardened][:shadow]                           = true
default[:system][:hardened][:passwd]                           = true
default[:system][:hardened][:shell_timeout]                    = true

default[:system][:hardened][:traceroute]                       = true
default[:system][:hardened][:mtr]                              = false
default[:system][:hardened][:ping]                             = true
default[:system][:hardened][:netstat]                          = true
default[:system][:hardened][:route]                            = true
default[:system][:hardened][:ifconfig]                         = true
default[:system][:hardened][:ip]                               = true
default[:system][:hardened][:dig]                              = false
default[:system][:hardened][:nslookup]                         = true
default[:system][:hardened][:host]                             = true
default[:system][:hardened][:wget]                             = true
default[:system][:hardened][:curl]                             = true
default[:system][:hardened][:ntpdate]                          = true

default[:system][:logindefs][:maildir]                         = "/var/spool/mail"
default[:system][:logindefs][:pass_max_days]                   = "90"
default[:system][:logindefs][:pass_min_days]                   = "7"
default[:system][:logindefs][:pass_min_len]                    = "8"
default[:system][:logindefs][:pass_warn_age]                   = "7"
default[:system][:logindefs][:uid_min]                         = "500"
default[:system][:logindefs][:uid_max]                         = "60000"
default[:system][:logindefs][:gid_min]                         = "500"
default[:system][:logindefs][:gid_max]                         = "60000"
default[:system][:logindefs][:create_home]                     = "yes"
default[:system][:logindefs][:umask]                           = "027"
default[:system][:logindefs][:usergroups_enab]                 = "yes"
default[:system][:logindefs][:encrypt_method]                  = "SHA512"
default[:system][:logindefs][:fail_delay]                      = "4"





