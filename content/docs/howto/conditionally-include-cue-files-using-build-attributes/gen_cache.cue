package site
{
	content: {
		docs: {
			howto: {
				"conditionally-include-cue-files-using-build-attributes": {
					page: {
						cache: {
							upload: {
								examples: "T0wFJqEj4QQ/L0gT7bJyFiKHAD1UfLo/hE+NkMeHA6w="
							}
							multi_step: {
								hash:       "BCDBUE4KFJ716B3B67TPFBIA2F0MLKEPEM96O4OI3551V0KL14TG===="
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
