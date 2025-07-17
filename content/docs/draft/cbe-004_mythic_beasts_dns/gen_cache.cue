package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "B0NsZCsz5gMRDSd9bt+0vXq4OU2xE9gUFY3baqjihnQ="
								"2": "tftTIWvDxxil+IEkAC1IXjy6s5JxDKh9mMwYAFDrHoQ="
								"3": "I9vWFfPTiP1TI1M4HKtOcV8XeYJWNcCPf/TDhlwmAUk="
								"4": "CNWmsbtUMPk5mGomhIbmEzX8glPMx/QCV8HeIyTk5cg="
								"5": "hZfBEiJyBjSp140wBs9WUFfuQoEYfGjcrhOvbFmLG8w="
								"6": "raTTRuS0ZvCoKXxug57mNY7X1vxehsRN0sl1SlsiHq8="
							}
							multi_step: {
								hash:       "8Q88VFUM1BDA3P3CRJCURSV7VMMT0TKRV7LUVOGLQGM61PG3HUR0===="
								scriptHash: "8T5T0B0K6S3NGIIOLM9255HN4DPN78BO9MK4UGDNESVR2HJLV9MG===="
								steps: [{
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue cmd dump
											"""
									cmd:      "cue cmd dump | head -20 >6.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff 6.expected.txt 6.actual.txt"
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
