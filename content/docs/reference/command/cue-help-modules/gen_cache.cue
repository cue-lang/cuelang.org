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
									hash:       "LIVL3LQ07KNMF20NQUU7O2O0F47MNA60398DL1G05V6POGMPI8EG===="
									scriptHash: "9TT7RJEI58MLOOAPAOI74TE2Q1LSSK0KQ9OJECINE3B8SHSL94A0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.2:$PATH"
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
