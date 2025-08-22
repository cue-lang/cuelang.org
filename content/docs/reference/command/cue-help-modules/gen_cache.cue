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
									hash:       "H1KUHOJ2L4UH4H98FP5KFJFCN694MCCMCSG0BRKVN3MMLTRH5ES0===="
									scriptHash: "R494POKOT58DRILT8NMUIAI9EHTUFFG37LCLOMU4IISDGFPPF8F0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-0.dev.0.20250822143201-1eff22f3f91f:$PATH"
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

												\tcue help mod

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
