package site
{
	content: {
		docs: {
			howto: {
				"conditionally-include-cue-files-using-build-attributes": {
					page: {
						cache: {
							upload: {
								examples: "Fm+zOBbJxgLP6UDt6df/wIPJEW9FNVdAtlNby89+WYE="
							}
							multi_step: {
								hash:       "B2MAC7DUFA0G6LJAT8VT19CR1EMIU809EKOFFLDBINTCPJUA29GG===="
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
