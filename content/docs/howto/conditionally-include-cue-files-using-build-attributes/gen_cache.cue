package site
{
	content: {
		docs: {
			howto: {
				"conditionally-include-cue-files-using-build-attributes": {
					page: {
						cache: {
							upload: {
								examples: "S3a5afBv5tGGzrixq9IOkd3jKzT+pO3s06ESeN2KWG4="
							}
							multi_step: {
								hash:       "1AVO21K1P6P1IJ4LQT9O1C24VG6L8OHOGLNSA7NBE5JND9FJHCQG===="
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
