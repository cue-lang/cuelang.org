package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "OobPT8kGyOldSp0Iq9fXPqmLG5NCKEPQBVnmVzXOm2I="
								"2": "XzQYivLWhRI2C14XW4Blqi8Z7OjutnaAh6zAvUIKgFs="
								"3": "hD866Gqccee7YJoggcU6UKHTM4b4VEwVLo9OWgaYOkI="
								"4": "64ZfM9aGnXPRc/5Ua8vTn7nSzZBzLzH9TgnEcUBuF24="
								"5": "EhmTTZXMCywU8t/+LdNIaU1PVFb3lfwoRSqzPmYZThk="
								"6": "KJADxGFA8U1PAH7VlekrRvzSEEI5mbApb+Go8QPjXyc="
							}
							multi_step: {
								hash:       "RF21QIP8J8TCQHURHTIK4SU711SFVE3LMV1D260GBP5R7ORQFFU0===="
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
