package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "3gznSB4s1U4piiqhMxe6OPdsR5CTrClLqjnhN5JdbOE="
								"2": "+OIJJ1QRdXDEQapQjhEjFzWVMAZtL/zfeN6oGURQrTI="
								"3": "+c3TOb7PORhQa3R1vNEdUbeArJGERpITw+BtS9oc7Gk="
								"4": "6+7M49NP/tQcXj8gaGfdllMOJT5tYz458LVzl58neYQ="
								"5": "oRikDK8CcFO0eQPbkJfINWijK+vTPPFvXnB66bphB4I="
								"6": "Vr6hDys/lkg4KXzILPGDnMnZ7/N5DDtPCh1LAM8TUe4="
							}
							multi_step: {
								hash:       "OBMU5IQ3RJU0RI6HUA0FK2TRR14TVQLBBIJUCI462I306DHR50VG===="
								scriptHash: "8T5T0B0K6S3NGIIOLM9255HN4DPN78BO9MK4UGDNESVR2HJLV9MG===="
								steps: [{
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue cmd dump
											"""
									cmd:      "cue cmd dump | head -20 >6.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff 6.expected.txt 6.actual.txt"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
