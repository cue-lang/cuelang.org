package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "R3+Q9m4Dv3FHSxeDC8IbNZ4/VtyWUwzU8jbIB4Fshdg="
								"2": "gl1/dxqzPdFL/mNiHdD6I7NDwqwOAhdYkhcfJpD2IqA="
								"3": "ar/upJ3XMKA9SINSTzR+A6UigfbLzJWhQZ2zG4bXmJo="
								"4": "yV2c0j8B91V5PHvEFgpYFNCyzR7SuAUfCdKFmkCTYLU="
								"5": "Ts9R2oQgI0x3o2wheakmzp+i9KAzbde0IxG9UeLFw8k="
								"6": "htCkWnUZcylmK6Dt3z68IdAwt58Ew6CWwevQSmq+IAg="
							}
							multi_step: {
								hash:       "RJNAIKPC7SOAAA4NU9PP9C24NQ1S9FHRTEF0LDL9V85US04TH4J0===="
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
