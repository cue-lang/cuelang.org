---
title: Getting started with Docker Compose + CUE
draft: true
no_index: true
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD

# Switch to CUE tip, as this page will only be seen on tip.cuelang.org
# and it's easiest to align behaviours here, inline, rather than using
# the internal/patch/tip.diff mechanism.
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
{{{end}}}

{{<info>}}
Curated modules are a work in progress and your feedback is important!
Please [report any issues]({{<report-issue-url>}}) you find.
{{</info>}}

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[compose files](https://github.com/compose-spec/compose-spec/blob/main/spec.md#compose-file)
used by [Docker Compose](https://docs.docker.com/compose/) and
[podman-compose](https://github.com/containers/podman-compose).

This guide shows you how to get started defining your compose files in CUE using
[curated modules]({{<relref"curated-modules-faq">}}).

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login
{{{end}}}
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its schemas.

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
{{{with script "en" "cue mod init"}}}
cue mod init cue.example
{{{end}}}
You can choose any module name you like - it's easy to
[change it later]({{<relref"docs/reference/command/cue-help-mod-rename">}}).
It makes sense for your CUE module to exist at the root of the source code
repository you're working with, but the commands in this guide will work in any
setup.

## Create a compose file

Declare a compose file in CUE. This one is based on a comprehensive example from
[`docker/awesome-compose`](https://github.com/docker/awesome-compose/tree/master/pihole-cloudflared-DoH):

{{{with upload "en" "1"}}}
-- compose.cue --
package localdev

import "github.com/cue-tmp/jsonschema-pub/exp3/dockercompose"

files: example: dockercompose.#Schema & {
	version: "3.7"
	services: {
		cloudflared: {
			image:          "visibilityspots/cloudflared"
			container_name: "cloudflared"
			ports: [
				"5054:5054/tcp",
				"5054:5054/udp",
			]
			environment: [
				"TZ=${TIMEZONE}",
				"PORT=5054",
				"ADDRESS=0.0.0.0",
			]
			restart: "always"
			networks: "dns-net": ipv4_address: "172.20.0.2"
		}
		pihole: {
			container_name: "pihole"
			image:          "pihole/pihole:latest"
			ports: [
				"53:53/tcp",
				"53:53/udp",
				"67:67/udp",
				"8080:80/tcp",
				"8443:443/tcp",
			]
			environment: [
				"TZ=${TIMEZONE}",
				"PIHOLE_DNS_=172.20.0.2#5054;1.1.1.1",
				"WEBPASSWORD=${PIHOLE_PW}",
				"REV_SERVER=true",
				"REV_SERVER_TARGET=${PIHOLE_ROUTER_IP}",
				"REV_SERVER_DOMAIN=${PIHOLE_NETWORK_DOMAIN}",
				"REV_SERVER_CIDR=${PIHOLE_REVERSE_DNS}",
				"ServerIP=${PIHOLE_HOST_IP}",
				"ServerIPv6=${PIHOLE_HOST_IPV6}",
			]
			//dns:
			//- 127.0.0.1 // "Sets your container's resolve settings to localhost so it can resolve DHCP hostnames [...]" - github.com/pi-hole/docker-pi-hole
			//- 1.1.1.1 // Backup server
			volumes: // store your data between container upgrades
			[
				"/etc/pihole/:/etc/pihole/",
				"/etc/dnsmasq.d/:/etc/dnsmasq.d/",
			]
			cap_add: ["NET_ADMIN"]
			depends_on: ["cloudflared"]
			restart: "always"
			networks: ["dns-net"]
		}
	}
	networks: "dns-net": ipam: config: [{subnet: "172.20.0.0/24"}]
}
{{{end}}}

In later guides we'll add more entries to the `files` struct.

The `import` at the top references the appropriate curated module for the file.
Its path is currently temporary, but only while its proper location is being decided.
The temporary path isn't a problem because one important property of the
[Central Registry](https://registry.cue.works)
is that, once a schema is published, it will always be
available at that location.
When the curated module’s location is finalised and versions are published
under the new path, you can use the
[`cue refactor imports`]({{<relref"docs/reference/command/cue-help-refactor-imports">}})
command to update your CUE easily, so it reflects the new location.

## Tidy your local CUE module

{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`]({{<relref"docs/reference/command/cue-help-mod-tidy">}})
when you use a curated module for the first time.

## Validate your compose file

{{{with script "en" "vet"}}}
cue vet -c
{{{end}}}
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your compose file.

## Export your compose file as YAML

{{{with script "en" "export"}}}
cue export --outfile compose.yaml -e files.example
{{{end}}}
{{{with _script_ "en" "HIDDEN: move before diff"}}}
mv compose.yaml{,.got}
{{{end}}}

If you chose to export the `files.example` shown above,
your validated YAML file will look like this:
{{{with upload "en" "yaml"}}}
-- compose.yaml --
version: "3.7"
services:
  cloudflared:
    container_name: cloudflared
    environment:
      - TZ=${TIMEZONE}
      - PORT=5054
      - ADDRESS=0.0.0.0
    image: visibilityspots/cloudflared
    networks:
      dns-net:
        ipv4_address: 172.20.0.2
    ports:
      - 5054:5054/tcp
      - 5054:5054/udp
    restart: always
  pihole:
    cap_add:
      - NET_ADMIN
    container_name: pihole
    depends_on:
      - cloudflared
    environment:
      - TZ=${TIMEZONE}
      - PIHOLE_DNS_=172.20.0.2#5054;1.1.1.1
      - WEBPASSWORD=${PIHOLE_PW}
      - REV_SERVER=true
      - REV_SERVER_TARGET=${PIHOLE_ROUTER_IP}
      - REV_SERVER_DOMAIN=${PIHOLE_NETWORK_DOMAIN}
      - REV_SERVER_CIDR=${PIHOLE_REVERSE_DNS}
      - ServerIP=${PIHOLE_HOST_IP}
      - ServerIPv6=${PIHOLE_HOST_IPV6}
    image: pihole/pihole:latest
    networks:
      - dns-net
    ports:
      - 53:53/tcp
      - 53:53/udp
      - 67:67/udp
      - 8080:80/tcp
      - 8443:443/tcp
    restart: always
    volumes:
      - /etc/pihole/:/etc/pihole/
      - /etc/dnsmasq.d/:/etc/dnsmasq.d/
networks:
  dns-net:
    ipam:
      config:
        - subnet: 172.20.0.0/24
{{{end}}}
{{{with _script_ "en" "HIDDEN: diff"}}}
diff -u compose.yaml{,.got}
{{{end}}}

## Run your compose file

Instatiate the compose-based services by using the `docker compose up` or
`podman compose up` commands. (This example
[needs a couple of environment variables](https://github.com/docker/awesome-compose/tree/master/pihole-cloudflared-DoH#env)
to be specified beforehand.)

The `cue.mod` directory should be stored in your source code repository,
along with your `compose.cue` and `compose.yaml` files.

Whenever you update your CUE file, re-run the `cue export` command shown above,
and then record any changes to these files and directories.
