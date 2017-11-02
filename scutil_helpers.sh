scutil_query() {
    key=$1
    scutil<<EOT
    open
    get $key
    d.show
    close
EOT
}

scutil_add() {
    guid=$1    
    ips=$2
    search_domain=$3
    sudo scutil<<EOT
    open
    d.init
    d.add ServerAddresses * $ips
    d.add DomainName $search_domain
    set State:/Network/Service/$guid/DNS
EOT
}

install_search_domain() {
    search_domain=$1
    guid=$(scutil_query State:/Network/Global/IPv4 | grep "PrimaryService" | cut -d " " -f 5)
    log "guid: $guid"
    ips=$(scutil_query State:/Network/Service/$guid/DNS | egrep -p "\d\s:\s(\d+\.)" | cut -d " " -f 7 | xargs)
    log "ips: $ips"

    scutil_add $guid "$ips" $search_domain    
}