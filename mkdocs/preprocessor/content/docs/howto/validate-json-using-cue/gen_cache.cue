package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "NZD3x8Ob7bPnWFXewZoS+NcJuDfY4e8pAUZ8WjeRYVA="
								"x.cue":        "DJO7DW0MJ/Uw9yW6RebPe/b6XnL63dX3zITla9CP6Y4="
								"x.json v2":    "L5/KqvEUfb+FCKz031cOlbXCIAvDBRLgv7J+vpsE2O8="
								"fixed x.json": "Pvt8wVrz8MKRYxXzZB+c2OAms1iPd9S7tR/GNBfVApI="
							}
							multi_step: {
								hash:       "U42JG3GFLR8V5P2BA78K48M1GOU4DAUCDSVDK4EL05ON0B05I2NG===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
