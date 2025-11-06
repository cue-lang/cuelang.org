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
									hash:       "33SRDNSJ92M322JLDE97RE4VOJRMLTNNUAETUK1KJ1FGDORSE69G===="
									scriptHash: "406GIFFBS6I38PU62KI1INRN8TRKRKV8QNM8C3JTT85RVBK9SOG0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0:$PATH"
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

												Note that this command is not yet stable and may be changed.

												Usage:
												  cue mod resolve [<modulepath>[@<version>] ...] [flags]

												Flags:
												      --deps   resolve all dependencies in the current module

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
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
