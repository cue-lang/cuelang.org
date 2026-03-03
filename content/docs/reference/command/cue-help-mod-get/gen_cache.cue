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
									hash:       "4JL9NUT4J401RJK4V087VS0M00UVBTAE89MT36R2K836L0UH1C3G===="
									scriptHash: "KMM4FLM64CIHQ18TU5P06IOH8FK5U0P7PNVM5S5OG1OJRS4Q0HSG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0:$PATH"
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

												Usage:
												  cue mod get [flags]

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output

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
