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
									"manifest pre":  "Ak3H6ZS8bvkHPml0ZZbrNQl9jQl0YXSe1unt5nMWJro="
									"manifest post": "k93E6lnJ7FmmS41XRBQAUKjEopvhRNfZOXGETb3Vqig="
								}
								multi_step: {
									hash:       "LENN4MA399FD48I1DFA6JIO220CJA8OOIQLO9I9VPSA99C9K2C90===="
									scriptHash: "2HJTFA27NBOPRAQIPTH1J3MVGNKS3H7MPA63F613BFV3OUK4O350===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.3:$PATH"
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
												cue version v0.13.0-alpha.3
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
										cmd:      "mv manifest.cue .manifest.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff manifest.cue .manifest.cue"
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
