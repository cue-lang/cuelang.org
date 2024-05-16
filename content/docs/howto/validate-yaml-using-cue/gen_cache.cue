package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Afm/xr2w6EcAUm3EvQnE+6RCp4TaAo5Etc5/NhVC8+s="
								"initial x.cue":  "4tMRdR3lZ+dU11xasNbSDcziAzGGPkhm3dVNj5Rv0Qc="
								"another person": "cq91RHtT66fuJ1BQqS7QKzK1oBjGa+UMvz049Jrm/ho="
								"fixed yaml":     "WIvNPBDYokvA9Z2wB7JIQWApxt0IgXLaXQDicx8e1sM="
							}
							multi_step: {
								hash:       "2HRU77NSB2CT2MSCKKRSLQ9R4EFUDRFILFPHBRPQEPRG96TVGE60===="
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
