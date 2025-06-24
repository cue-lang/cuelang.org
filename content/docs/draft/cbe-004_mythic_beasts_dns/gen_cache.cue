package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "zbg+zLll2fL2Q5LLu5FWE1tKrbGbRm9FCdyBytEmDMQ="
								"2": "KXosR8kRF1q0sXp6v0em6Ian/8ssBRN2nuoq9OxpqjA="
								"3": "NQGtyKoXNszCWQSskoBx1eiTOVEU+S9cV92nV1KJ9rk="
								"4": "V9CSafUFYt6wM+jwiHTW6cmQXoUl/W1TxqAk8V52YQ4="
								"5": "AFfkx1Zczi3p2MLhKZBM6qBvGc8mE/6VRl8CcZ4OH44="
								"6": "5jutVFk+gLApPjSrWjt4k/hmN279rRfYkc+keczJZyg="
							}
							multi_step: {
								hash:       "7AKONPA4B5CIPI5VDNNGBJUUQATEJ2PE7EBI19MK6D6LP1GFMQG0===="
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
