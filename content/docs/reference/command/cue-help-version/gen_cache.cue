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
									hash:       "REU2SG0PL6FOKL73UBN7AL4SIV92J9FUQ30JMSGKN0GG8TT28KRG===="
									scriptHash: "KTRE1S3GNCDFMUH2OA830TJ5FSR5VFP5C9HMPLDON6GPOVR1H0A0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.17.0:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help version"
										exitCode: 0
										output: """
												print the CUE version and build information

												Usage:
												  cue version [flags]

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
