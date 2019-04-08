class deploy {
file { '/home/ec2-user':
        ensure => directory,
        owner => 'ec2-user',
        group => 'devops',
    }
file { "/home/ec2-user/":
        mode => "0755",
        owner => 'ec2-user',
        group => 'devops',
        source => 'puppet:///modules/deploy/files/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar',
        notify => Exec[run_app],
      }
      exec { "run_app":
        command => "java -jar spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar",
        cwd => "/home/ec2-user/", #directory to execute from
        path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:",
        refreshonly => true
      }
  }
