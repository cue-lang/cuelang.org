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
									hash:       "ND4PJMLIENR13OI89IKQS5CI3RQFFEC4MOF13T9G8ASAOOBQVJS0===="
									scriptHash: "GQ8DVHRF6490Q2KMAGC9PCNU144RCC663AEQL8KDBTJ1DVM1POLG===="
									steps: [{
										doc:      ""
										cmd:      "cue help mod resolve"
										exitCode: 0
										output: """
												WARNING: THIS COMMAND IS EXPERIMENTAL.

												This command prints information about how a given
												module path will resolve to an actual registry in the
												form of an OCI reference.

												If the module version (which must be a canonical semver version)
												is omitted, it omits the tag from the reference.

												It only consults local information - it works lexically
												with respect to the registry configuration (see "cue help registryconfig")
												and does not make any network calls to check whether
												the module exists.

												Note: you must enable the modules experiment with:
												\texport CUE_EXPERIMENT=modules
												for this command to work.

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
