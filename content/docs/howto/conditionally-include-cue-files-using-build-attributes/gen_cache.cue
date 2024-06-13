package site
{
	content: {
		docs: {
			howto: {
				"conditionally-include-cue-files-using-build-attributes": {
					page: {
						cache: {
							upload: {
								"A.cue": "3ZB4SjqU+r+mUxPEywGKBw7YYhzUD93PWqW6qC8Fm20="
								"B.cue": "8DP/lPYnmW5nvSQnAwAaeteXGDEmvRQueAx5u8pznoA="
								"C.cue": "x9IKrw2uH4bTKi/TaLhVXCBvk3aISpx2cLVj6zeLvko="
							}
							multi_step: {
								hash:       "U487TLI0I2B0RHJKCFVSGP03R16U0M99NFOTKI33LTCFH71QJ38G===="
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
