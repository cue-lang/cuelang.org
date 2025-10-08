package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "Gu9liRgwqmeD4Rot1jdBow0UWz5GpO3c1OFDBtUL//g="
								"2": "swrEYi3uUBNmP4JpobH7jfNjWH1ImVxxiCFOH4Uw8GA="
								"3": "gIc1Okp5qS52B+rHytUE5pTZ6tVywQElGG6FVWkjU9o="
								"4": "OXaqIYGzU7mLPEUt74DupRGr5N3VuxXmdFGfl5OT2aM="
								"5": "9sgBbwcsYyRUP35ZPuYb3g+8d/tjUZcxguz/0m2F1Z8="
								"6": "H6RhMSyU0cl7Z0O8ZX39Arr9waCeyezDqFDxwx35Zmc="
							}
							multi_step: {
								hash:       "R2JHMKP3AUSSB4MGB7CM5084AOHE2VSNIVJF22VJ2ARKTMC6E93G===="
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
