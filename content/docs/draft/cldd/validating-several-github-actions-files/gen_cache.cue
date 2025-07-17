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
									"file 1": "9GeknNJn1xc/jZFwuctFxLiw2Cwi0fELf/6fq/wNZfA="
									"file 2": "aV2vdBEUK1HM1W2sAyPOPlJHd1hcL71W6g3SFe2TEYw="
									cue:      "99r282rDx8Ki4al0SaQaa9OF4qk8r54jF/Cx/RPKql0="
								}
								multi_step: {
									hash:       "UM2PCPNJNIDMAC8ATJF868I73RP2GH3VD14LAP62TU8CBQV2HAFG===="
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
