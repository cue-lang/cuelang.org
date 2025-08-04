package site
{
	content: {
		docs: {
			howto: {
				"embed-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "0x/jHT9n5GJHQC6wOYYlWE8ewfWbj6phhQzzoWjpYkY="
							}
							multi_step: {
								hash:       "27G5R4H00L6OQ4401PVFL5JG1AETH9PF8HJU07ODUKV5P84T07UG===="
								scriptHash: "6CVB0H73A96VKBHC2QKK1U9V1JH3C87HJA96GOMVDOJ279QGJRJ0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											oneFile: |
											  # How to use this project

											  ## Installation

											  Fetch the latest release from the official site,
											  and unpack it in your home directory. Next ...
											manyFiles:
											  a.json:
											    aField: a value
											  b.json:
											    aList:
											      - 1
											      - 2
											      - 3
											  c.json:
											    anObject:
											      foo: a
											      bar: b
											      baz: c

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
