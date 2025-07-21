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
									manifest: "4wKrY6NzQuFJW0GwYcN9jMf9/M2IcNvB4XahY8JJjpA="
								}
								multi_step: {
									hash:       "KHRPSL60DNN3T46JQ8MJCA1SLLJFH45GF521N2D2LQ7AVM3LU83G===="
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
