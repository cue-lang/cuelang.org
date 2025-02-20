package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-version": {
						page: {
							cache: {
								multi_step: {
									hash:       "522J4OL4AVFKCCCBLLTD0TM28HLG6IITK9UE0DJD97OA2J6TG5VG===="
									scriptHash: "2Q3JMTEJFPJUN9A3L05OK60GFUH4SS2EHHIS5ULKD19H8UHPQHB0===="
									steps: [{
										doc:      ""
										cmd:      "cue help version"
										exitCode: 0
										output: """
												print CUE version

												Usage:
												  cue version [flags]

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
