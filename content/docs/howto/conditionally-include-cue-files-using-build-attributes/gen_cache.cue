package site
{
	content: {
		docs: {
			howto: {
				"conditionally-include-cue-files-using-build-attributes": {
					page: {
						cache: {
							upload: {
								examples: "z1zpKOeU/qd+GkwTlGb7dtNocLCIUkBCBirSRlqCQ98="
							}
							multi_step: {
								hash:       "EJNILSPL8DL7PFN3QJMH8BR83AUSIRJ4HPFH6VPNVHOM6K5BSR5G===="
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
