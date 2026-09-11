package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-tidy": {
						page: {
							cache: {
								multi_step: {
									hash:       "VAOR5B26E0DS13L4E1RVQ0IT54CB8ILL3UG9BBOD46J24GEQL8T0===="
									scriptHash: "1EATM0C1TA8QEH9PULAMV2GJNTM17SG57A55HS57TR1M9T9VTA7G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.0.0-goreleaser.202609101448:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod tidy"
										exitCode: 0
										output: """
												Tidy resolves all module dependencies in the current module and updates
												the cue.mod/module.cue file to reflect them.

												It also removes dependencies that are not needed.

												It will attempt to fetch modules that aren't yet present in the
												dependencies by fetching the latest available version from
												a registry.

												See "cue help environment" for details on how $CUE_REGISTRY is used to
												determine the modules registry.

												Usage:
												  cue mod tidy [flags]

												Flags:
												      --check        check for tidiness after fetching dependencies; fail if module.cue would be updated
												      --local-only   only update cue.mod/local-module.cue, leaving cue.mod/module.cue unchanged

												Global Flags:
												  -E, --all-errors     print all available errors
												  -C, --chdir string   change working directory before running command (must be the first flag)
												  -i, --ignore         proceed in the presence of errors
												  -s, --simplify       simplify output

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
