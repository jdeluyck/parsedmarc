# parsedmarc Docker container

## What's this?

It's a docker container that contains parsedmarc and MaxMind's [geoipupdater](https://github.com/maxmind/geoipupdate).

## What's parsedmarc?

A great tool to parse [DMARC](https://en.wikipedia.org/wiki/DMARC) reports.
Source is on [https://domainaware.github.io/parsedmarc/](https://domainaware.github.io/parsedmarc/)

## What do I need to run it?

You can get the docker image here: [ghcr.io/jdeluyck/parsedmarc](ghcr.io/jdeluyck/parsedmarc)

There's one volume to mount, to /config. This will give you access to the GeoIP.conf and parsedmarc.ini files.
