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
									"file 1": "+AoaJ9GBVpIiRRPBzyYCPFglPsrpkplNH1MEio4Eff4="
									"file 2": "tHsbOrWBX5NO0wGpep4cHqyBGo7ZTTHm48n4ihPsVrg="
									cue:      "4Sr17f4JYsyIj3xCbM/I9tmJxEouDf3LZ9TzHcmrWd8="
								}
								multi_step: {
									hash:       "7REEM22MGKU5UIVB4NBFH9CF3FSKUH74UTM3RF1QV6IEPP8JKP70===="
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
