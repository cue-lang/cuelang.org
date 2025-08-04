package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "IrEnRO1QviuOjZGgE+5QiKXu40elwISHhyjQ5sMPZbY="
								"initial x.cue":  "X6O0HPryKQN7OKE3YDJzfQmsOGRateRXHQcpJyQBjGQ="
								"another person": "KkN/pfyt8XND0YuOrbYXtFeha40LQ+L79wEvmy63VgI="
								"fixed yaml":     "yYbKViHMD9yAMPMytCgkfOKipgcnhMAPBM9XAOecl3c="
							}
							multi_step: {
								hash:       "1B4EKSA73B2BL8IEJC4TK85N9G7SEKHO0D86E1HEUGSM6HMHSJ50===="
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
