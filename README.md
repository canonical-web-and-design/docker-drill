***Deprecated and archived***

*We no longer use this, and it is no longer actively maintained.*

---

# Drill

A tiny Docker image for performing DNS lookups using [`drill`](http://linux.die.net/man/1/drill).

[`drill`](http://linux.die.net/man/1/drill) is a similar tool to [`dig`](http://linux.die.net/man/1/dig).

## Usage

Basic example:

``` bash
$ docker run ubuntudesign/drill google.com
;; ->>HEADER<<- opcode: QUERY, rcode: NOERROR, id: 31251
;; flags: qr rd ra ; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0 
;; QUESTION SECTION:
;; google.com.  IN      A

;; ANSWER SECTION:
google.com.     299     IN      A       216.58.198.174

;; AUTHORITY SECTION:

;; ADDITIONAL SECTION:

;; Query time: 64 msec
;; SERVER: 8.8.8.8
;; WHEN: Thu Jun 23 21:22:39 2016
;; MSG SIZE  rcvd: 44
```

Command help:

``` bash
$ docker run ubuntudesign/drill -h
drill version 1.6.17 (ldns version 1.6.17)
Written by NLnet Labs.

Copyright (c) 2004-2008 NLnet Labs.
Licensed under the revised BSD license.
There is NO warranty; not even for MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.
  Usage: drill name [@server] [type] [class]
        <name>  can be a domain name or an IP address (-x lookups)
        <type>  defaults to A
        <class> defaults to IN

        arguments may be placed in random order

  Options:
        -D              enable DNSSEC (DO bit)
        -T              trace from the root down to <name>
        -S              chase signature(s) from <name> to a know key [*]
        -I <address>    source address to query from
        -V <number>     verbosity (0-5)
        -Q              quiet mode (overrules -V)

        -f file         read packet from file and send it
        -i file         read packet from file and print it
        -w file         write answer packet to file
        -q file         write query packet to file
        -h              show this help
        -v              show version

  Query options:
        -4              stay on ip4
        -6              stay on ip6
        -a              fallback to EDNS0 and TCP if the answer is truncated
        -b <bufsize>    use <bufsize> as the buffer size (defaults to 512 b)
        -c <file>       use file for rescursive nameserver configuration
                        (/etc/resolv.conf)
        -k <file>       specify a file that contains a trusted DNSSEC key [**]
                        Used to verify any signatures in the current answer.
                        When DNSSEC enabled tracing (-TD) or signature
                        chasing (-S) and no key files are given, keys are read
                        from: /etc/unbound/root.key
        -o <mnemonic>   set flags to:
                        [QR|qr][AA|aa][TC|tc][RD|rd][CD|cd][RA|ra][AD|ad]
                        lowercase: unset bit, uppercase: set bit
        -p <port>       use <port> as remote port number
        -s              show the DS RR for each key in a packet
        -u              send the query with udp (the default)
        -x              do a reverse lookup
        when doing a secure trace:
        -r <file>       use file as root servers hint file
        -t              send the query with tcp (connected)
        -d <domain>     use domain as the start point for the trace
        -y <name:key[:algo]>    specify named base64 tsig key, and optional an
                        algorithm (defaults to hmac-md5.sig-alg.reg.int)
        -z              don't randomize the nameservers before use

  [*] = enables/implies DNSSEC
  [**] = can be given more than once

  ldns-team@nlnetlabs.nl | http://www.nlnetlabs.nl/ldns/
```

