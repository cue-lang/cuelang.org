package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-fluxcd-helmrelease-k8s-crd-manifests": {
						page: {
							cache: {
								upload: {
									policy: "dfjNNVzykGGq2tj4NZ0Ols4upe0QxCPyruBaCVc2A5w="
								}
								multi_step: {
									hash:       "16DF50QU5K6RNP6KR900M5QRF17N7OECN68K8IA4QNUT0H3S0M7G===="
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
