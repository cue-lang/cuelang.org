package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"k8s-io-moving-from-cue-get-go-to-central-registry": {
						page: {
							cache: {
								upload: {
									"manifest pre":  "CeJWDnuw+bkeRAKxnBBS0A9i9JdrkBw5JDwFGXRv3tI="
									"manifest post": "XlAvnwZwFMe2jevu1bk6jxaB0sk9GAAp1wLKbAotUJY="
								}
								multi_step: {
									hash:       "4D7G5N31JPRODPE3FT42DEKB541C8J5DE5ORSAFRPEPK5PL6B04G===="
									scriptHash: "5VKVO0TU1V5C947N4M3UC828J315PO0BRTMPP2HNNOR6SVPID090===="
									steps: [{
										doc:      "# Caches."
										cmd:      "export GOMODCACHE=/caches/gomodcache"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "export GOCACHE=/caches/gobuild"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# Registry access."
										cmd:      "mkdir -p $HOME/.config/cue"
										exitCode: 0
										output:   ""
									}, {
										doc: ""
										cmd: """
												cat <<EOD >$HOME/.config/cue/logins.json
												{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
												EOD
												"""
										exitCode: 0
										output:   ""
									}, {
										doc:      "# TODO(jm): revert to latest when it has evalv3 as default."
										cmd:      "export PATH=/cues/v0.13.0-alpha.4.0.20250430133040-3ba376f34cb6:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod init kube.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 0"
										cmd:      "go mod init kube.example"
										exitCode: 0
										output: """
												...

												"""
									}, {
										doc:      "#ellipsis 0"
										cmd:      "go get k8s.io/api"
										exitCode: 0
										output: """
												...

												"""
									}, {
										doc:      "#ellipsis 0"
										cmd:      "go get k8s.io/apimachinery"
										exitCode: 0
										output: """
												...

												"""
									}, {
										doc:      ""
										cmd:      "cue get go k8s.io/api/apps/v1"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.4.0.20250430133040-3ba376f34cb6
												...

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue refactor imports k8s.io cue.dev/x/k8s.io"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod get cue.dev/x/k8s.io@v0.0.0"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod tidy"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat cue.mod/module.cue"
										exitCode: 0
										output: """
												module: "kube.example"
												language: {
												\tversion: "v0.13.0"
												}
												deps: {
												\t"cue.dev/x/k8s.io@v0": {
												\t\tv: "v0.0.0"
												\t}
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm -r cue.mod/gen/k8s.io/"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c"
										exitCode: 0
										output:   ""
									}]
								}
							}
						}
					}
				}
			}
		}
	}
}
