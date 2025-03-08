package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-modules": {
						page: {
							cache: {
								multi_step: {
									hash:       "IH4I9HO89CHHB329PBDCP3ERCFG092PHHBH0OKQFUT81QDS0RHGG===="
									scriptHash: "L1OJ2449JD644L4DPNMJP80E7LR01I15EGVD0UJT329V9DJ3AGC0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-0.dev.0.20250306134408-5d2da079a295:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help modules"
										exitCode: 0
										output: """
												Modules are how CUE publishes packages and manages dependencies.

												A module is a collection of packages that are released, versioned, and
												distributed together. Modules are downloaded from OCI-compliant
												artifact registries.

												The Central Registry for CUE modules (registry.cue.works) is
												used as the source for external modules by default.

												For a detailed reference on modules:

												\thttps://cuelang.org/docs/reference/modules/

												For information on commands that interact with modules:

												    cue help mod

												For tutorials on how to use the Central Registry, see:

												\thttps://cuelang.org/docs/tutorial/working-with-the-central-registry/
												\thttps://cuelang.org/docs/tutorial/publishing-modules-to-the-central-registry/

												For a tutorial on how to work with a custom OCI registry for CUE modules:

												\thttps://cuelang.org/docs/tutorial/working-with-a-custom-module-registry/

												For information on how to specify the CUE registry:

												\tcue help registryconfig


												"""
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
