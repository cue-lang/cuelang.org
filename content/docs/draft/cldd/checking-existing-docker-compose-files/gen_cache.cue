package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-docker-compose-files": {
						page: {
							cache: {
								upload: {
									file: "9/UWWD6052xM5D0NMKCKmPdl64bYPpkj1SxjVc2gbbU="
								}
								multi_step: {
									hash:       "QN7HPT586048ABH1ONRE7FQ5J4NQMJ6N71LUBC2BLBB6N3KGJ590===="
									scriptHash: "M2ROK9H3FCU8P067TOOH99T3AKQGQ3Q4HGVU5U6PUVGTBMVLETH0===="
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
										doc: """
												# Switch to CUE tip, as this page will only be seen on tip.cuelang.org
												# and it's easiest to align behaviours here, inline, rather than using
												# the internal/patch/tip.diff mechanism.
												"""
										cmd:      "export PATH=/cues/v0.13.0-alpha.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Schema' github.com/cue-tmp/jsonschema-pub/exp3/dockercompose@latest compose.yml"
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
