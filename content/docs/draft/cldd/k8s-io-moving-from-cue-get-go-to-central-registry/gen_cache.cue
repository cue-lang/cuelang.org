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
									"manifest pre":  "HP5PcMog9E11WrdoNB89z7b01zYPA8SS3RTcuo9xfu0="
									"manifest post": "wmaIos8DXJNX0n/EQNrdlTsMh3KSnpsqC9pbUbsREdQ="
								}
								multi_step: {
									hash:       "V2PM27BBSTS3SAKE6GMUSFM71KFP18MKAIO8KDIQI9GSF0I8MIN0===="
									scriptHash: "ER901LTBNJO4A7TK2LEIEB16EJAM7926I9GCC5T0RFET3E5A3SNG===="
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
										doc: """
												# Switch to CUE tip, as this page will only be seen on tip.cuelang.org
												# and it's easiest to align behaviours here, inline, rather than using
												# the internal/patch/tip.diff mechanism.
												"""
										cmd:      "export PATH=/cues/v0.13.0-alpha.1.0.20250321144843-86e62b281609:$PATH"
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
												cue version v0.13.0-alpha.1.0.20250321144843-86e62b281609
												...

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue refactor imports k8s.io github.com/cue-tmp/jsonschema-pub/exp3/k8s.io"
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
										cmd:      "cue mod get github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0.0.0"
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
												\t"github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0": {
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
