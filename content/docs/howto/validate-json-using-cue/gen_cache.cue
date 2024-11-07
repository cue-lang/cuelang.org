package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "tkDuzsx5p2RfkUvpORGyR7qm1rlRY/BL3JtGV/7SNuI="
								"x.cue":        "DvRz3dl/7zDuU7MVTfQkaGCXc612/LbaV/U6/W0LlCg="
								"x.json v2":    "NXWrnnTkLrEl0zK2Co7k+400BkUncDbXJYSap80WqwA="
								"fixed x.json": "ZI3CNR5BHZzWFuPGxmEyB7KcFbBIQ4dAPeFrGaXh2cM="
							}
							multi_step: {
								hash:       "FAU0KANVENN3LSN7V0B5D2GUMHJIVJUKJ67IM04JC95DIR1NN47G===="
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
