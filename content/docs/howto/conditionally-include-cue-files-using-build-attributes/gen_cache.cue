package site
{
	content: {
		docs: {
			howto: {
				"conditionally-include-cue-files-using-build-attributes": {
					page: {
						cache: {
							upload: {
								"A.cue": "C27UwoetxUefM7t5iD5p6NlzKEFTaxp2so/zQYipBVE="
								"B.cue": "gSuZkk7fSJgK3y1HW98alE6vJ57Lzndqrren6Oj+82I="
								"C.cue": "/GQFwovnSKhi8dpAzZtDcdQZfjhwlVSxpWhWZ8iT5Zw="
							}
							multi_step: {
								hash:       "H9T6PDHT92U21EF2L9O9PU7H635IK6TTG9N5LA604EIJHBC802N0===="
								scriptHash: "SI7IB10I213H8D3QRR2165TVKQJ8C5486TTGGAT7LT113CNDQ050===="
								steps: [{
									doc:      ""
									cmd:      "cue export"
									exitCode: 0
									output: """
											{
											    "data from A.cue": true,
											    "data from C.cue": true
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export -t foo"
									exitCode: 0
									output: """
											{
											    "data from A.cue": true,
											    "data from B.cue": true,
											    "data from C.cue": true
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export -t bar"
									exitCode: 0
									output: """
											{
											    "data from A.cue": true
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export -t foo -t bar"
									exitCode: 0
									output: """
											{
											    "data from A.cue": true,
											    "data from B.cue": true
											}

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
