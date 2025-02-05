package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "OJZJBSl/9qxlB6Ht6RVEWfbfb3Xx8Q3jNnEHxEP+ebA="
								"x.cue":        "iSDk4cnluYSKGS9JtA2JnXBWdeEQL2lwKfxE76OwXno="
								"x.json v2":    "+izt2VPE7MmLIzMea60F/dcM6fXILspx9CPNGydnG6I="
								"fixed x.json": "d8zTtyweiaHhNkaY2874WhytU6euhConBc9eT2S0rJ4="
							}
							multi_step: {
								hash:       "NIRFM3SSDB3FEM22G50O560UHESCLUUMVKBC0Q18VQE9LK2L27UG===="
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
