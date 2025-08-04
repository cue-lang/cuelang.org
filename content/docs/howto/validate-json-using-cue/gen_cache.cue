package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "SFZM+BBXUk3x3xFTsPMwe0LXjLjY1rN7vLOFNHCxWWM="
								"x.cue":        "GtVxMnhoQ/tUPwO92OBUiKshkyGCbrBlHIzAMdV/CDo="
								"x.json v2":    "Q2kOT3MDq063tfbnkCabNdOuqcCznTj4lXpX8XvKxRU="
								"fixed x.json": "wAfPVLbWBYH5iKR6pGguIbdwXSwMuWmAtjtiGbiF43g="
							}
							multi_step: {
								hash:       "CVEDCNKP7L4QQGFP01QAPK31LSP8P5IE2DO3FGBFD1FM8IC43F30===="
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
