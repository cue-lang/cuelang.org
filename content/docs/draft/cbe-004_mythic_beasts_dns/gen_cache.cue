package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "J+VI4u3q2x0QJ2mOfOGM7N9/rYvP9sc5JDEQw1HSQFw="
								"2": "fi/asNUubH/W0PCv14HtaFX32JLPxfErNr6dm68Mdzk="
								"3": "I1e1KYt/mOPwaPFl4vkVbgW1C/Ooxu5QsjDVnDjm63M="
								"4": "moIfBUY8CT9DyZhU+YS4QVUeDa3q5seQNOM2vJ3GjC0="
								"5": "3GhTgys+KgTWBTb9gUjw6DyCpHNBGta158rwx8Fsxs0="
								"6": "vzqcSzehmvu9iVykGLYP31nVq3JRw+TCicPuFqy0pGw="
							}
							multi_step: {
								hash:       "E01E5LG5GJGN1T5ET6EM30B8JKV2UFA4KFFK0DK8RMUDUG83A3VG===="
								scriptHash: "FSA0I8OK9NEDVD22VOU707U926VUFSSTASVP4GE4BF61L38H8B40===="
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
