package site
{
	content: {
		docs: {
			howto: {
				"conditionally-include-cue-files-using-build-attributes": {
					page: {
						cache: {
							upload: {
								examples: "AFMI0sauxZxN3jD+Z0sV/6CKJAkOyqT21HqrLiSsPa0="
							}
							multi_step: {
								hash:       "AUIKBSS5OILPDARLGFIBFBC31UVB33UHIHMTPQAF6NJMH2NO4MOG===="
								scriptHash: "5U9IOJ0N56KQI44J6UAVMMRA03QJV5U3BQ36TEPH57N054J4NMJ0===="
								steps: [{
									doc:      ""
									cmd:      "cue export"
									exitCode: 0
									output: """
											{
											    "data from bar.cue": true,
											    "data from qux.cue": true
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export -t foo"
									exitCode: 0
									output: """
											{
											    "data from bar.cue": true,
											    "data from foo.cue": true,
											    "data from qux.cue": true
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export -t bar"
									exitCode: 0
									output: """
											{
											    "data from qux.cue": true
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export -t foo -t bar"
									exitCode: 0
									output: """
											{
											    "data from foo.cue": true,
											    "data from qux.cue": true
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
