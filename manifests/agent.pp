define logentries::agent (
    $logname,
    $logpath = $title,
    $logtype = '',
)
{
  exec { "follow ${logpath}":
    command   => "/usr/bin/le follow ${logpath} --name '${logname}' --type='${logtype}' 2> /dev/null ",
    onlyif    => "/usr/bin/le followed ${logpath} | grep 'NOT following'",
    require   => Package['logentries'],
    notify    => Service['logentries'],
  }
}
