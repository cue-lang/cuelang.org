package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"file one":      "CV3vN0qphmAjxsxBbsfzw49GPLBIKdDe9tWlYpAags0="
							"file two":      "JJ0jzoQinuqyHITcixijxC76goyue+h3M30Y+li/P78="
							"a hidden file": "kvzhIl5TTXo5kjthHoa7HcEELKPlIjGHdocti0WDujg="
						}
						code: {
							"a code example": "EFVLfvzZdiAQGjP0sI8MFNCN1ebzaj9ULX1v9RRITxM="
						}
						multi_step: {
							hash:       "PCEC2JJP0767GJLGJN98NRNQTEID5MGP93N270D2V687NSA5D2B0===="
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
