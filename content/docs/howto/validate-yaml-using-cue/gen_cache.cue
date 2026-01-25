package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "/H5C+k08iDvBwhDrVN0mUwyVWfrLJRlhJnuEQoq3hbY="
								"initial x.cue":  "sPrQPGgZZxmRXmZSpbFEQVYQ6bBWHiE9YyXoDZJie+c="
								"another person": "FDTVQFElpjQP8QnxavvmCrZHavMvQCw97qLJa0XapNc="
								"fixed yaml":     "AbRHRX4VaaLfRULghhcUdqbzfgaQ2r6tKDvuHd7a16w="
							}
							multi_step: {
								hash:       "ASQHG9RJHGCRK6MC4UD7NCSPLBQN31RHTTOBNDOCI8M1VBIBARQG===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
