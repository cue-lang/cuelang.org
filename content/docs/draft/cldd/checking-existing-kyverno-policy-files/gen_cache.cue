package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-kyverno-policy-files": {
						page: {
							cache: {
								upload: {
									policy: "OLuTxZivbUj0KdOTym5/JnDc8503/PLTvZB/Yz7xpGI="
								}
								multi_step: {
									hash:       "K2JCNT639GDVBVT4MNLFA3SGMV6BO46PUS17CKKI41UC8SMAC55G===="
									scriptHash: "0GNV46KODIFLACS6JPHVOPTUQJ7UJ75NIBR1EIVPASGTVN3E32M0===="
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
										cmd:      "cue vet -c -d '#ClusterPolicy' cue.dev/x/kyverno/clusterpolicy/v1@latest require-labels.yaml"
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
