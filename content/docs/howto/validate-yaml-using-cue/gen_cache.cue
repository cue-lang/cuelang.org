package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "bbp1jR0foa5D+eKtPI7QRYNRdjd+cx4L7aGyQ9ff7JA="
								"initial x.cue":  "+twYMWa952145n5JCyQq5ke/NVdWOjB8vXQZbt1b8qc="
								"another person": "VzjiUPUVrgMR0hiwKDs9+JpJoO0+azlkNVFJl1vgGrU="
								"fixed yaml":     "rPJZBCMXw5rADM8vv4d1vZSk+j0246OVPCcuNl9QJpM="
							}
							multi_step: {
								"9HN2PIOPROQ7N28O4I8CB8FV4MQFCIHM7OG87H1VKN40L6C401R0====": [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
