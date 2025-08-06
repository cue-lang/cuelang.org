package site
{
	content: {
		docs: {
			howto: {
				"conditionally-include-cue-files-using-build-attributes": {
					page: {
						cache: {
							upload: {
								examples: "RcPCHLMXe3h4yJU0byq5UNqS8SqnhVWdFjEbH+jogZw="
							}
							multi_step: {
								hash:       "J2PMCQ89BNRJ01FO7MVG9PJ05BLHKEDDJV156J959BG7VTB2P47G===="
								scriptHash: "OP5EC8DILTRT2467KRDHBO4QBQT045F1HIFP02QC1ANBCCVP7SRG===="
								steps: [{
									doc:      ""
									cmd:      "cue export"
									exitCode: 0
									output: """
											{
											    "data from bar.cue": true,
											    "data from baz.cue": true
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export -t foo"
									exitCode: 0
									output: """
											{
											    "data from bar.cue": true,
											    "data from baz.cue": true,
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
											    "data from baz.cue": true,
											    "data from qux.cue": true
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export -t foo -t bar"
									exitCode: 0
									output: """
											{
											    "data from baz.cue": true,
											    "data from foo.cue": true
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
