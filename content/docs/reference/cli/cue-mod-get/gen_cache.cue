package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-mod-get": {
						page: {
							cache: {
								multi_step: {
									"2VPD0PRB1123GS650CASIVPR91UB4NE21F6O9B09373NC8VV3PIG====": [{
										doc:      ""
										cmd:      "cue help mod get"
										exitCode: 0
										output: """
												WARNING: THIS COMMAND IS EXPERIMENTAL.

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

												Note: you must enable the modules experiment with:
												\texport CUE_EXPERIMENT=modules
												for this command to work.

												Usage:
												  cue mod get [flags]

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
