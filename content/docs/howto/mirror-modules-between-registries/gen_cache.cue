package site
{
	content: {
		docs: {
			howto: {
				"mirror-modules-between-registries": {
					page: {
						cache: {
							multi_step: {
								hash:       "OL0KN4RPH9PT3LELOD97ORTJIJR42J2P6TDI9UI1S9949I95A91G===="
								scriptHash: "OAGDUS47BB2FQ3BDQ3PVGI45K2IKAEA08AJSAFA45T79D4AMOL6G===="
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
									cmd:      "export PATH=/cues/v0.13.0-alpha.1.0.20250322080417-cfbeb48088c9:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0-alpha.1.0.20250322080417-cfbeb48088c9
											...

											"""
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
