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
									"file 1": "4MbmmZe6cMrCwaTQnQKiBfMjM8YiiHVPz1E4SNcu1og="
									"file 2": "J0J9XabGi9DWw1HdmqYMtkkYi4cUtFIalLE6t7q9vWI="
									cue:      "HseHPdJpBz2BfreCn+ZmI/ORswcUO5b5NbMfqR3Xorc="
								}
								multi_step: {
									hash:       "4VBBDUA36IG5MKPGHT0Q8MT5U738IJ2P8GDO8F5ME5OT8I3BG040===="
									scriptHash: "DM38BT83Q76QISJVMTS9I415UJK7D9UOIPK28AEAI24511CEV3AG===="
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
