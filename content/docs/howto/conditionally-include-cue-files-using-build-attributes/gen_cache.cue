package site
{
	content: {
		docs: {
			howto: {
				"conditionally-include-cue-files-using-build-attributes": {
					page: {
						cache: {
							upload: {
								examples: "Yz/zJYdrET+HWbtyrHxujOA2mjRWyNy9Es0YLWKx/V8="
							}
							multi_step: {
								hash:       "L2D6Q8C37MBDF33QFK4M13NHA00IP0VHB1H2JBL7B2JFBGRGPFAG===="
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
