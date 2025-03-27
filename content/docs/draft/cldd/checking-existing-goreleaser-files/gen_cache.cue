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
									hash:       "OSJMOTV1JGBM0P27MR74P7MRRMGR77P3AODMHUB7GR3K6MSTRV60===="
									scriptHash: "K2LIIOO08NB7UM95C56O028GO9E8PSCUURE3GTU3ATEBLOBJ0G80===="
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
										cmd:      "cue vet -c -d '#Project' test.cue.works/x1/goreleaser@latest goreleaser.yml"
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
