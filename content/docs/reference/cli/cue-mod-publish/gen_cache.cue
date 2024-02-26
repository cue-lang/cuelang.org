package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-mod-publish": {
						page: {
							cache: {
								multi_step: {
									"1TT90PLS9FE6IRR3SBNSQQUPUUOD21O2Q01L6LHMP0VRJUC45Q5G====": [{
										doc:      ""
										cmd:      "cue help mod publish"
										exitCode: 0
										output: """
												WARNING: THIS COMMAND IS EXPERIMENTAL.

												Publish the current module to an OCI registry. It consults
												$CUE_REGISTRY to determine where the module should be published (see
												"cue help environment" for details). Also note that this command does
												no dependency or other checks at the moment.

												Note: you must enable the modules experiment with:
												\texport CUE_EXPERIMENT=modules
												for this command to work.

												Usage:
												  cue mod publish <version> [flags]

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
												      --strict       report errors for lossy mappings
												      --trace        trace computation
												  -v, --verbose      print information about progress

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
