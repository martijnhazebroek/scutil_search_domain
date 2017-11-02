scutil_query(){
    key=$1
    scutil<<EOT
    open
    get $key
    d.show
    close
EOT
}

scutil_add(){
    ips=$1
    service_guid=$2
    sudo scutil<<EOT
    open
    d.init
    d.add ServerAddresses * $ips
    d.add DomainName corp.infosupport.com
    set State:/Network/Service/$service_guid/DNS
EOT
}

intraportal() {
    service_guid=$(scutil_query State:/Network/Global/IPv4 | grep "PrimaryService" | awk '{print $3}')
    service_name=$(scutil_query State:/Network/Service/$service_guid/DNS | egrep -p "\d\s:\s(\d+\.)" | cut -d ":" -f2 | xargs -n2)
    scutil_add $service_name $service_guid
    open "https://intraportal"
}
