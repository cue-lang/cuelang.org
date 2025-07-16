package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-kubernetes-storage-snapshop-crd-manifests": {
						page: {
							cache: {
								upload: {
									manifest: "4XiI4khmCS8fcZPhiOhrtoIEf42I1Eaapzkb0XpEXgU="
								}
								multi_step: {
									hash:       "UN9VDNAVDA2599VL7A6D007M09BDG1AO5PD4P25QMFI48GER9710===="
									scriptHash: "N4TV499NS0BGJJC0FEJT636GJL1NNTUVVV6K26ROP19F8Q7OFGQ0===="
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
										cmd:      "cue vet -c -d '#VolumeSnapshot' cue.dev/x/crd/k8s.io/storage/snapshot/v1@latest manifest.yaml"
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
