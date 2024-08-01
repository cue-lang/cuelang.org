package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "vxGWfvxPAEQcYgeVtcyon7Fcdusg90+HVxWCu51Pq+s="
								"x.cue":        "CODq3Tt5w+lbMh3pG8xxuRN7crlfmgmC5LM3AcCukSk="
								"x.json v2":    "yjv8e3dj6PYcQrj3HNKspMgdevjJVDmUMLI/uLpHu28="
								"fixed x.json": "urAhVtGpeEuirt8MEiL6yFduPMh02FQnS9TO+j+vkKg="
							}
							multi_step: {
								hash:       "RJ1SK4EA6RVJ4MCTBEL2E5N3ULRMQ1L2ETG8MRKJ3S5NCGPGCTOG===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
