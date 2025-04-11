package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"validating-several-github-actions-files": {
						page: {
							cache: {
								upload: {
									"file 1": "/Nb1emv5Ya90FMYNas9N1h+L4cashls9MyfGWAirDOo="
									"file 2": "vvj1uqIKzmzs2AkZCcmMn/BCDhhEsjQ6KWEotDHg+Og="
									cue:      "EYm0wXhYQN/bieiSQav3yXtX2REKYRFB5XxuL8lX7TI="
								}
								multi_step: {
									hash:       "0UGPR62EHK02CA9E2T9G71NGNCUBTFP35666M887E381BVJU8QOG===="
									scriptHash: "Q56QI3SKEEH2DUGK8CPJPE2U5PFCBHKF3FSQ2HDRQ01TKDUE8KGG===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.4:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.4
												...

												"""
									}, {
										doc:      ""
										cmd:      "cue mod init cue.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod tidy"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c"
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
