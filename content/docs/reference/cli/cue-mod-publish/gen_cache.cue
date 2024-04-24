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
									hash:       "2RVODVJ75EDA2FS8OGTLQ607AK8J9RKDV2IIP15E8H66CVS5483G===="
									scriptHash: "S7UQQ96MAIU3RHJAPQ6I9R6SRJANCTJS1QH2STSG70L9KB94GMT0===="
									steps: [{
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
