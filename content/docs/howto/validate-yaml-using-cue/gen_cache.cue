package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "9FvvuIfVsp6gGPUks2+Ikx82YuwcVLio/iKmK/Ixs0g="
								"initial x.cue":  "0H3AUY/ih0CqlHkEJoyap0VnZ054hh+lRniGRR/VKdY="
								"another person": "l73Prw/cBADsvUwyExkujMtfE1nT5Rq1sTmFAE7Cqi4="
								"fixed yaml":     "ut828uuTfI0zyFExnuTPRD6WpN9XqkUDRnH0fPVgz10="
							}
							multi_step: {
								hash:       "0GDO0ME2N9G3ANT4I7PVN9AMICIE504PVOTF97SV8821L8KMNRS0===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
