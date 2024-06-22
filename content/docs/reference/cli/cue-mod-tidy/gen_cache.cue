package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-mod-tidy": {
						page: {
							cache: {
								multi_step: {
									hash:       "D09E7BKVGM623000G0U8L444RJM9F4E8GGJ6GF7J68I8V1E4FK00===="
									scriptHash: "TVCS3F6LMT3U2OG3ISLNF0PG1CUC2RHRH4BM3R5CB5QNSPOCR98G===="
									steps: [{
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

												Note that this command is not yet stable and may be changed.

												Usage:
												  cue mod tidy [flags]

												Flags:
												      --check   check for tidiness only; do not update module.cue file

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
