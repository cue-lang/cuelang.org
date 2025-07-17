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
									policy: "9eQ5MLZrEiPn8XlvzaAhNLqsPScymUZ6zhgaIMIas7c="
								}
								multi_step: {
									hash:       "BH5E3V325O73FCRFSE8E6FUA4RS1U69LRJVC3C5LJCI0VKUBB0TG===="
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
