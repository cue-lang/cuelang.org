package site
{
	content: {
		docs: {
			howto: {
				"conditionally-include-cue-files-using-build-attributes": {
					page: {
						cache: {
							upload: {
								examples: "OQNzXv/MOaRFD4D+LhLb3SdtC0tWSe2biQ/gAcvyb7o="
							}
							multi_step: {
								hash:       "O5R4VOD8NPH3BV9AP405FLGPU1QTFG6I2UN5TNSOMGUDAL8IQP70===="
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
