package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-crd-k8s-storage-volumesnapshot-manifests": {
						page: {
							cache: {
								upload: {
									manifest: "JEI8ijKWTdhqo5q3nmJAzJtOxmYq7Ohrbmm9DdKIknE="
								}
								multi_step: {
									hash:       "26AK3NHN39SN5IBTC8GFTNBGFT2FGOU15LQRQ79R9P14GLFSKJV0===="
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
