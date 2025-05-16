package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-azure-pipelines-files": {
						page: {
							cache: {
								upload: {
									pipeline: "EAPf6u3ABXwFJ5kVUL9OX28Y8EBAI8l3OxfLcV7tDOE="
								}
								multi_step: {
									hash:       "JIGOLMRHIEUVHS2LCTG8HH8SMVL0VQ48UTBL7IM9NDAM10K6FJQG===="
									scriptHash: "OUVPVI6E6RKIBA6L1KBT6F10Q1U4IKF7UVT9PIUU8P92LO32QFI0===="
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
										cmd:      "export PATH=/cues/v0.13.0-rc.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-rc.1
												...

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/azurepipelines@latest pipeline.yml"
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
