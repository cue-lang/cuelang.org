package site
{
	content: {
		docs: {
			howto: {
				"conditionally-include-cue-files-using-build-attributes": {
					page: {
						cache: {
							upload: {
								examples: "f8t1VPX8r2NJF+9w8e8nEbXlla1NBpVXD/2jNwg6No4="
							}
							multi_step: {
								hash:       "K0AEOAS404MJTM0VT7BETUFPORLCIR5Q0K52A1CGQAJVTBQ6NL10===="
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
