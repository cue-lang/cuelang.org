package site
{
	content: {
		docs: {
			howto: {
				"mirror-modules-between-registries": {
					page: {
						cache: {
							multi_step: {
								hash:       "SJVHVFVC0KF2L2HRPVURJN4HKU2OOQLB3DR5R2UMC151LULRRHNG===="
								scriptHash: "SEG2R6K4EID6S7DFHEGLVG67ILEIFN35OQUL504LO5RJ7P95FQLG===="
								steps: [{
									doc:      "# Access to Central Registry."
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
											# Local registry.
											# TODO: this is inherently racey. But not a problem in practice...
											# for now. When it does become a problem we can solve this properly
											# using a nc-based wait loop or similar.
											"""
									cmd:      "nohup cue mod registry localhost:55443 >/tmp/cue_mod_registry 2>&1 &"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod mirror --to 127.0.0.1:55443 github.com/cue-tmp/jsonschema-pub/exp3/k8s.io"
									exitCode: 0
									output: """
											mirroring github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0.1.0

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
