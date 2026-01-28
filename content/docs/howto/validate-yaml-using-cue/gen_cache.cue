package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "It9SkmyUl9ZZsqwiH6zvV16Bt1tSuTA1iJmAu6Bnibs="
								"initial x.cue":  "VvNHSX79g8rkZwffkwPmWBDZWqLOE1ayVsZqxW6TdOU="
								"another person": "L3hZDL7jjTTqIcclo45cCe6Sr3Vo5Ku58+6Pzfvcrvk="
								"fixed yaml":     "MqNDYbeh0L/fZFxmF+ted96cXmHMUDg0tJjkpp6cfj8="
							}
							multi_step: {
								hash:       "N506AB1HG0HLN2D5I80Q51698VF12A3NIVA4Q63O51AF2ELT7UU0===="
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
