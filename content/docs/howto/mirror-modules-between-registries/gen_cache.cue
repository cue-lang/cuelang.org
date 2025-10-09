package site
{
	content: {
		docs: {
			howto: {
				"mirror-modules-between-registries": {
					page: {
						cache: {
							multi_step: {
								hash:       "3E9RI7KQFEVHR4SQFOP9I36HQFVDKD61A98UHRTUN9V60MEQDJF0===="
								scriptHash: "L0FQMUH3J90BONJPIB55LMQG8V9IM2GNSGAB887E0360KNS3PPA0===="
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
									cmd:      "cue mod mirror --to 127.0.0.1:55443 cue.dev/x/k8s.io"
									exitCode: 0
									output: """
											mirroring cue.dev/x/k8s.io@v0.5.0

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
