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
									hash:       "P6I2LBQQ42QQAVFC1MK5U5UK2DJSP1ECOJU7V5E9TUJBI71JE4EG===="
									scriptHash: "53L09OIT6QSD7QLQU2F63PPO75NACTQUSDSIT5DUHPUT8R61MTQ0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-0.dev.0.20250822143201-1eff22f3f91f:$PATH"
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

												Note that this command is not yet stable and may be changed.

												Usage:
												  cue mod resolve [<modulepath>[@<version>] ...] [flags]

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
