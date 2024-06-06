package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"file one":      "lCU9iHtwJRYyol3n+XugT++VpBXFr5IaLy0EgDm4UFQ="
							"file two":      "Q6T0gsTCt8Mnrci3EbgPUFPYfhEMK3DPHPH23KaEfhU="
							"a hidden file": "/QiwmsSnGO6p8c7j6OFN2yGz/ky+44wy+jwtOaXa458="
						}
						code: {
							"a code example": "SmpE181WHSqm7wyr7LoFCH7s4moNiDTVGMKMBp0RZ5Q="
						}
						multi_step: {
							hash:       "ITHIDKCID6SLUT901R1U428U48QKO54SJSJ8H61MAV1M8N8QTLIG===="
							scriptHash: "E5NI97NUHDU688HAUL4HNFJ9D89OK3NMLI3HQ5QRFJ58GTDJ6GAG===="
							steps: [{
								doc:      ""
								cmd:      "cue eval"
								exitCode: 0
								output: """
										x: 1

										"""
							}, {
								doc:      ""
								cmd:      "cue eval >result.txt"
								exitCode: 0
								output:   ""
							}, {
								doc:      ""
								cmd:      "cat *.txt"
								exitCode: 0
								output: """
										y: 2
										x: 1

										"""
							}, {
								doc:      ""
								cmd:      "grep bar foo.txt"
								exitCode: 0
								output: """
										bar

										"""
							}]
						}
					}
				}
			}
		}
	}
}
