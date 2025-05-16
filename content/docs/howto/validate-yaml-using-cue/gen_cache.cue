package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "8vyqdKy6+WIKN8CuvffrkpNG0v4xpNeLtNOP39mAbas="
								"initial x.cue":  "8pAq0R0sEaf/6mMsxF6tmjn5yIC4SaSsT541/QPqHYo="
								"another person": "/2U75SRO9/eXH2OGD5PFxJKPPRn1If5vhERiddTJLww="
								"fixed yaml":     "vgHoEDzRlJEBEuO8rJP4nSbn9/YjTYyQz47nmBsRM6g="
							}
							multi_step: {
								hash:       "H9SDJVM7G62KF5MES9KJUIB6191TIA5VUNUDD1E2NCENI3EJDL8G===="
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
