package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-goreleaser-files": {
						page: {
							cache: {
								upload: {
									file: "9/vtUIJtIFXmgvJmvqmPsgmWllqTaOIvYsBUxCRNEAY="
								}
								multi_step: {
									hash:       "VKR6E5P4K5JA7RBI933M55Q993NR8RMKNGHTAKDBN9BRIRK9VKRG===="
									scriptHash: "RUIP663GBAUNEJJUHK8GUE92CGM4E5B8VBBGC2MV9MLLSH118410===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Project' github.com/cue-tmp/jsonschema-pub/exp3/goreleaser@latest goreleaser.yml"
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
