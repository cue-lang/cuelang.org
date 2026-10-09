package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-resolve": {
						page: {
							cache: {
								multi_step: {
									hash:       "K6ABHAK8SKLCRLRJAT9DTICLU1IRAEDA8KCV7PMJ19HE2M0ME320===="
									scriptHash: "EBABD2LEGBNFA6EPQ5GQGFT9MDJM2F7U8KB3F8HVH37EK8UNV5G0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-alpha.3.0.20261008224848-a4f52c2332e4:$PATH"
										exitCode: 0
										output:   ""
									}, {
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

												If no arguments are provided, the current module path is used.
												This is equivalent to specifying "." as an argument, which
												also refers to the current module.

												If the --deps flag is provided, all dependencies from the current
												module are resolved and displayed. The --deps flag cannot be used
												with module path arguments.

												Usage:
												  cue mod resolve [<modulepath>[@<version>] ...] [flags]

												Flags:
												      --deps   resolve all dependencies in the current module

												Global Flags:
												  -E, --all-errors     print all available errors
												  -C, --chdir string   change working directory before running command (must be the first flag)
												  -i, --ignore         proceed in the presence of errors

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
