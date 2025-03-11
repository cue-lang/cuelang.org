package site
{
	content: {
		docs: {
			howto: {
				"mirror-modules-between-registries": {
					page: {
						cache: {
							multi_step: {
								hash:       "TIA35GJBU212HB54OKNL53ICLH36UKDBDC72VG90VK2FIOCN8T6G===="
								scriptHash: "6MKCKL0JA0QP6SHF3RCU0TQD3O0GQBDL573IT8U4TJFC7ARK1TVG===="
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
