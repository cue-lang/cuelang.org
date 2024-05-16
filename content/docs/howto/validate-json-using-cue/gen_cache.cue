package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "E1HkrvRNz/28ro6a2YnfyYSUPV6k/BWrjChcJCl19VY="
								"x.cue":        "Gei0qYXVgiPh4ezMTZTc5+p9Ixx+ULYeprAXBC9jwro="
								"x.json v2":    "X5KpE5VfzL9JrUwCN5VpHCN7XxdP0QgXosjxvMAiPHo="
								"fixed x.json": "ahksnUVSyUgluwj+8W4eIsqeU5VLSusLnYuxgVzT/Mc="
							}
							multi_step: {
								hash:       "J29FRQHTLGGKM62UGTL11BI6Q1K0J0376SGIPDHKPMN00IBT96MG===="
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
