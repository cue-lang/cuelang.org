package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "DrDhlrGcK9eQvbEt4ZdYyErU6GEx8ZF+hou4UeFGHQI="
								"cue_types_gen.go 1":     "omQD/Xup7nxFqydNJBKLqnx4mNveUkqSTPpHIYG4H44="
								"example 2":              "LeRAmMpuSHX/WxlBPnsayEyR6poPXLeMq/mjLCfyF1E="
								"cue_types_pet_gen.go 2": "k4cZ9zO2nQPFeFpwfshkIjVrw4sboXpu0K4EHdLSO7I="
							}
							multi_step: {
								hash:       "M1CPQ796VVRMFLTSUU67M46LKG1OR2JPGG6BDQFR7HVAVA18GEL0===="
								scriptHash: "ENTKF17DD7DNV7030J6UPAS40QU1DIO156V282TQ7OB9E272PPE0===="
								steps: [{
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c # Check we've not encoded anything odd in our CUE."
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
