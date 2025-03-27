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
									hash:       "76P7ONA5P9HHPEEBGS0DG4HV1PUSC5S02JC05N432K17D5HMFGLG===="
									scriptHash: "TM21DA429GJT308Q32J6PBS3TDAG5BB2GQNJFKJ75DNQAAH1LAG0===="
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
