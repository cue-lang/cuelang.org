package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "ZTXpIVr+kuFcCiI5RdNaCgberWX/q5rKJe7Mv39pOhY="
								"initial x.cue":  "dEtp1MSenqXcUMCmcPUX/n8eRymMiZyL4lRyAAeVOZo="
								"another person": "9KetmICps3YR4Cxz1l/M/dIQXSURr+s8D/AUyLC7Zgc="
								"fixed yaml":     "sY8jEydMYkz0tRYCs6UMj1iknaCGCWwwv/wQFOr+NYc="
							}
							multi_step: {
								hash:       "MQQD77LVIV4P8J7ROG8HMVMQ1DA7Q7JT0ED5EVA9AUOAFMGAV6VG===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
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
