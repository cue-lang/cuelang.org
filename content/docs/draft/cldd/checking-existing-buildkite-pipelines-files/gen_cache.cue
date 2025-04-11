package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-buildkite-pipelines-files": {
						page: {
							cache: {
								upload: {
									pipeline: "Idl1eMZANfMYl9wUgT11oYXPExIHMr6PVqOSFWajEJw="
								}
								multi_step: {
									hash:       "TPB5CS06N017M73EIG3IN7LMK81CIKAS5S2K3AU8JDM4HRTPNPP0===="
									scriptHash: "0KB1DMBSP9RNGJ11VVP5DQ6LL2DM4UNH0OK3T3ECGSD6RH0S5GD0===="
									steps: [{
										doc:      "# Registry auth"
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.3.0.20250411164907-08c3542c9d96:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.3.0.20250411164907-08c3542c9d96
												...

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/buildkite@latest pipeline.yml"
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
