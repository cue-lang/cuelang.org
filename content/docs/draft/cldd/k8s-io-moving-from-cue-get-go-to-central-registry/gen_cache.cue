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
									"manifest pre":  "5Nz7/r2Ucayd3AlbzpmtSCzVRAUuYQ1YRdTH3Ig4XLQ="
									"manifest post": "jeNJKQj8ePo24pwehOze8VokTz9Tl5ad6GVVEfSHWA4="
								}
								multi_step: {
									hash:       "TV0AU8OVQUFDBL7BA4OPSAB1000T5FH7GEUI459GFN9JQBKISRQG===="
									scriptHash: "K90I6LJNC9VSN0KM27SFUQD961EJ6QQ6HHKQR4VJ7C1D1NJBO7C0===="
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
												\tversion: "v0.13.2"
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
