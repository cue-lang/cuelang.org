package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-kubernetes-storage-snapshot-crd-manifests": {
						page: {
							cache: {
								upload: {
									manifest: "9i1lbtllPl2Aoj3pH0CUdSgopGmWn+O7qQUxhuwKMbk="
								}
								multi_step: {
									hash:       "TOLD8AQTM0V7DA7BIO7CCGIPB7M27CELJ4K85T9LIDFO6J56K76G===="
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
