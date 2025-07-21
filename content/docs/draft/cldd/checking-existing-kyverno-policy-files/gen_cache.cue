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
									policy: "lFd0nDJ4s4j/qUkIEB36h0x2ekh8Qb8kiS0azQjryhk="
								}
								multi_step: {
									hash:       "BVUGC9QA3PVJPLOLS2V5U4QOSGL5T4RVT7V9M3LN4RMNRF556M60===="
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
