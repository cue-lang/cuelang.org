package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "HOs7jmLfRt9mlXUOUKkbEVruUzcYN9xAizPkftZQmF8="
								"2": "h0XPbMsstoOOAWCKQgE6lQwXGjePUnqhVarDEUTUwuI="
								"3": "h0LavH9yP9zVk9YIfjOQscgY6N1dhR5Ou6fhN8lT8wI="
								"4": "yaagZJvn+1IDdDGzLtn+Bc1PaWZ5295cd7kAonRDjNw="
								"5": "our9nM6UR+Y1gXjtr1sorBCawVO5I6papB6rMC0rAck="
								"6": "3LLlgPD9qNgybLJXDjUf3TQShKmt26wb5xueIKNZe9I="
							}
							multi_step: {
								hash:       "26KDH3DKD6O17Q604V7QLVIBS1446MH3MLATA7GDGRKBEOAJNDS0===="
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
