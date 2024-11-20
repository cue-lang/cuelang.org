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
									hash:       "MH3DCHI598CC2GMTE2AURVE7IQGJ7ET9JD58NJ4PF7UPM6VI1OI0===="
									scriptHash: "CVRJS618FN5OO5KARTUENV9MQ42VF96QN916A8H11TEE7966GN60===="
									steps: [{
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
