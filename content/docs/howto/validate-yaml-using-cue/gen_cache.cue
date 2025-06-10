package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "8JvFUm3J+L3kPB7sb4tJZLLeOn7wtXqbIjxicja/U7Q="
								"initial x.cue":  "ePUdkH1JwlKZw5T4FDWQ5PLfnieiYv1nkOk6WB9183U="
								"another person": "d9j2eVm9WlhOyfX0SBUSBVQpDxbb5Q4zIxv18EBqqEs="
								"fixed yaml":     "j1EXwhnVJfkbZc/LFMB3ZA61M/RsJ1AiX9K39xiTqLE="
							}
							multi_step: {
								hash:       "O1M28FA9N3AEU4M1BAIHK69NFR6LPF0CUPPQNIBKM450K52RUFC0===="
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
