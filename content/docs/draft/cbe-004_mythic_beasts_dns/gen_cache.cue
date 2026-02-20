package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "7AzHGmEmAkwlCTCrFv+4rRqbnWJhxfBfJraTpZtM9U0="
								"2": "1sl7hTdwMSi3tphJqnGWf/NJLoLStyNtA0luCxOOrLI="
								"3": "DTIYOA1+cP4jR8pdu7sMcpR0r9JlCWIda6W0cGWSGy0="
								"4": "i/EnZ3JfqHrXmuDDdC5SS1SlUXuXH49RcY/M4v9uLWM="
								"5": "Bsm6xKee43uNs3KugCs9nh8eKEmQsLBtyo+UJse3g6c="
								"6": "jRW9jb82baCY5kSlUA8+w954jOEmAg+3HZqYLyjQJ9A="
							}
							multi_step: {
								hash:       "3974R43QBN15TEB1C6D8GLPR5PV24NUA6H1G8VJV9EL4PUG8ST7G===="
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
