package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "JDANSavo1ptAxV2ELtKRj2MNIGbq3x5Xzt143o7edKk="
								"initial x.cue":  "m2ZBTW90FRbwyuU38mcBboD4U8oNUDQ5DIYV+zvYZuo="
								"another person": "QfJf/dE3s9YlMdg8zMIXAmCSKi2BO0qemLU/e236XCA="
								"fixed yaml":     "FXTf/ta61K3et3k1/ufgUqGfEX3ykEjNHqERdJhyI2g="
							}
							multi_step: {
								hash:       "D07E3FDRFJ9EIBRTQMCFMRC3S8PI74AESRE51QTOV1EQS5ISVVJ0===="
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
