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
									hash:       "NBQFSPKV1ALH60VMFN1VHV5O41BVNEJQMLL4BVL6E5CST8F2H7KG===="
									scriptHash: "RMD6KCHD3NEROGL8UM9BRSUCLFDGQODDEH6FBK89IGGR0E7UP6Q0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-rc.3:$PATH"
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
												  -E, --all-errors[=true|false]   print all available errors
												  -C, --chdir string              change working directory before running command (must be the first flag)
												  -i, --ignore[=true|false]       proceed in the presence of errors

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
