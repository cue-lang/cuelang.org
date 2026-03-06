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
									hash:       "EGGAVBO26OLBN0D29JP8K9E1MREUIBHD44BGNU57RPK7FNAC7OI0===="
									scriptHash: "VO5DQ7Q588H5JMKE72MO54QVMKSRVF5MA15M12OPMJTMD2UCFA1G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-rc.1.0.20260306143617-9147ea2b06d9:$PATH"
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
