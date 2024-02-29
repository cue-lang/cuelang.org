package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "sd1r95wEBDSlrrR5bNApSwHYCZb+KanmhItx4UlkaU0="
								"initial x.cue":  "5moJEXN01EQ7Lxx2P9O0kq6CxZdRhdtQHxz3vO9qHUs="
								"another person": "4zjSPEnJcaWa3I8lsRwqLdm4TMeJcuvqOlNc1AuYeUE="
								"fixed yaml":     "NbQQH/fgNWzQaR2OqmHmA698Vr8DaPAKPKGHmC3KHxk="
							}
							multi_step: {
								"6ATA76QOTGGGCBMT932NVOJJSPG0MFF9OGNLSRJJ4FTT3JKTCP80====": [{
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
