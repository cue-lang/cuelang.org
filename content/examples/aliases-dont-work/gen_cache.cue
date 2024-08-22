package site
{
	content: {
		examples: {
			"aliases-dont-work": {
				page: {
					cache: {
						multi_step: {
							hash:       "9NH7JHJES7VBNILP2ST5JUD34JIBL8JPIV3AJTNUO6V3GIC7F7PG===="
							scriptHash: "LKK2S2FOEHEKNDRH6CT4VTTTU6BRQFRTETBOHLH0GJ7MUN527EUG===="
							steps: [{
								doc:      ""
								cmd:      "alias"
								exitCode: 0
								output:   ""
							}, {
								doc:      ""
								cmd:      "alias foo=\"echo hello\""
								exitCode: 0
								output:   ""
							}, {
								doc:      ""
								cmd:      "alias"
								exitCode: 0
								output: """
										alias foo='echo hello'

										"""
							}, {
								doc:      ""
								cmd:      "foo"
								exitCode: 127
								output: """
										/scripts/script.sh: line 49: foo: command not found

										"""
							}, {
								doc:      ""
								cmd:      "alias"
								exitCode: 0
								output: """
										alias foo='echo hello'

										"""
							}, {
								doc:      ""
								cmd:      "unalias foo"
								exitCode: 0
								output:   ""
							}, {
								doc:      ""
								cmd:      "alias"
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
