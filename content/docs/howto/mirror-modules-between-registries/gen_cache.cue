package site
{
	content: {
		docs: {
			howto: {
				"mirror-modules-between-registries": {
					page: {
						cache: {
							multi_step: {
								hash:       "SGGDKC9DJE2PDGLU2P1QM2959GDJBN011EBLOMKRJ2JI2PLA4ELG===="
								scriptHash: "T3E9H7QTLKBSKVUSR5IJFJ9U8BQMVGA2NC4TQUER0FVQC7PKPJ7G===="
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
									doc:      "# Access to \"cue mod mirror\" via tip of cmd/cue."
									cmd:      "export PATH=/cues/v0.13.0-0.dev.0.20250225142354-26a698fe9ae9:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0-0.dev.0.20250225142354-26a698fe9ae9
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue mod mirror --to 127.0.0.1:55443 github.com/cue-tmp/jsonschema-pub/exp3/k8s.io github.com/cue-tmp/jsonschema-pub/exp3/npmpackage"
									exitCode: 0
									output: """
											mirroring github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0.1.0
											mirroring github.com/cue-tmp/jsonschema-pub/exp3/npmjs/ava@v0.2.0
											mirroring github.com/cue-tmp/jsonschema-pub/exp3/npmjs/eslint@v0.2.0
											mirroring github.com/cue-tmp/jsonschema-pub/exp3/npmjs/jscpd@v0.1.0
											mirroring github.com/cue-tmp/jsonschema-pub/exp3/npmjs/prettier@v0.1.0
											mirroring github.com/cue-tmp/jsonschema-pub/exp3/npmjs/stylelint@v0.2.0
											mirroring github.com/cue-tmp/jsonschema-pub/exp3/semanticrelease@v0.1.0
											mirroring github.com/cue-tmp/jsonschema-pub/exp3/npmpackage@v0.3.0

											"""
								}, {
									doc:      ""
									cmd:      "pkill -f \"cue mod registry\""
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
