package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-get": {
						page: {
							cache: {
								multi_step: {
									hash:       "0JQLDDD6C2N0CN45A27CNQ2VM97NNFQBOF3G3FCIQRV2HNNRMC00===="
									scriptHash: "QFDE2I9PQ56THVVMUDMJIIL8AS619MRHL89Q2566T84J6OPGJDJG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod get"
										exitCode: 0
										output: """
												Get updates module dependencies, fetching new dependencies if
												needed and changing versions to specified versions. It can downgrade
												a version only when a higher version is not required by other
												dependencies.

												Each argument specifies a module path and optionally a version
												suffix. If there is no version suffix, the latest non-prerelease version
												of the module will be requested; alternatively a suffix of "@latest"
												also specifies the latest version.

												A version suffix can contain a major version only (@v1), a major and minor
												version (@v1.2) or full version (@v1.2.3). If minor or patch version is omitted, the
												latest non-prerelease version will be chosen that has the same major
												and minor versions.

												If the desired version cannot be chosen (for example because a
												dependency already uses a later version than the desired version),
												this command will fail.

												See "cue help environment" for details on how $CUE_REGISTRY is used to
												determine the modules registry.

												Note that this command is not yet stable and may be changed.

												Usage:
												  cue mod get [flags]

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
