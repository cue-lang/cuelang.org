package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "sgNQIUUA4uKPGjIbc08KRiyWbTrk7H3hnqLFGvKTflk="
								"2": "Cfiyw+wfkIWyimv9Wtv/r03X6UqENvOz1561ZELhZ2Y="
								"3": "7UQHga+KTDoGp1rWtyfpZc+zw2R7JL61Yc4FxNZfnW4="
								"4": "+76vkDDPml9qUzKhmbveFsndSbwvOnwHn7dzKImtxLs="
								"5": "II61ripOY9lqiqT3lYEYbJiLD5JOK84TZR63w7AqgQg="
								"6": "b/0rhB7HU6hYDcL9UvYP+VDVuhfGxvxZB7JNGMZveP0="
							}
							multi_step: {
								hash:       "TUFJ6G89CQGQVH8FNH73GFNPMLAC6LKUNKAT17DJLCUE2SDV5NO0===="
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
