package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-modules": {
						page: {
							cache: {
								multi_step: {
									hash:       "1OT5RR5UL89UMEBC3VC459MKBNONG9356LD1LE8N09M6D1606GDG===="
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

												For a detailed reference on modules:

												\thttps://cuelang.org/docs/reference/modules/

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
