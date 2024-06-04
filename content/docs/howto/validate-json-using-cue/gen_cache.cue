package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "36kC3ix2YchkWEjZrLBoAXtV+R7OpnlDw/C24pa09KQ="
								"x.cue":        "RoxoDecxLJ+VkuBuPsQo08Y9ARabFxlQuyec3+oZ+Gk="
								"x.json v2":    "sYfgjajDBCxMeUPxjRUDAfL2GJ078S8R/2qdB6oI8as="
								"fixed x.json": "jFpeXNnEaWJqNuJocq1eEECvmX4MgEYbTdvHituj/5g="
							}
							multi_step: {
								hash:       "L1LE7PRSI7FFVDK8DRCSIM3M1I1DSIEPB9T5T83EO4G4F45ID7MG===="
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
