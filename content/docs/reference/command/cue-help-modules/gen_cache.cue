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
									hash:       "5I77N930JOH4L5VKF3MTFLFEH5OE01NH37KJ7OS2MH0O00586JN0===="
									scriptHash: "GQ2B77H1B80E6J82SVMJ3BRHEMERK3G7AO2NCBN0R10250D6SFC0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.0-alpha.2.0.20250711132054-9ca9609cf83c:$PATH"
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
