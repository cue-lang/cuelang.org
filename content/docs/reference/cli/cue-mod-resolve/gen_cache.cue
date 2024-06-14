package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-mod-resolve": {
						page: {
							cache: {
								multi_step: {
									hash:       "ITR3J0PM09LB0UABS6HG6TIP3P0L3SCG76SFDEBCU4VU237P41EG===="
									scriptHash: "GQ8DVHRF6490Q2KMAGC9PCNU144RCC663AEQL8KDBTJ1DVM1POLG===="
									steps: [{
										doc:      ""
										cmd:      "cue help mod resolve"
										exitCode: 0
										output: """
												This command prints information about how a given
												module path will resolve to an actual registry in the
												form of an OCI reference.

												If the module version (which must be a canonical semver version)
												is omitted, it omits the tag from the reference.

												It only consults local information - it works lexically
												with respect to the registry configuration (see "cue help registryconfig")
												and does not make any network calls to check whether
												the module exists.

												Note that this command is not yet stable and may be changed.

												Usage:
												  cue mod resolve <modulepath>[@<version>] ... [flags]

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
