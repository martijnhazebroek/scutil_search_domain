# macOS: DNS search domains for your VPN

Use these scripts to add [DNS search domain functionality](https://en.wikipedia.org/wiki/Search_domain) to your VPN connection, if the built-in macOS functionality doesn't work. [iSstp](https://www.axot.org/2015/03/03/isstp-a-sstp-client-for-mac-osx/) for example, does not support it by default.


## How to install

1. Connect to your VPN.
1. Open a terminal (bash, zsh).
1. Enter the following command (don't forget to change the part [between and including the brackets]).

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/martijnhazebroek/scutil_search_domain/master/install.sh | sed "s/your.domain.tld/[insert your search domain here and remove the brackets]/")"
```

And you should be done. 

## How to use it the next time

1. Connect to your VPN.
1. Close your terminal if you just ran the install script.
1. Open a terminal (bash, zsh).
1. Enter the following command (don't forget to change the your.domain.tld part).

```bash
install_search_domain your.domain.tld
```