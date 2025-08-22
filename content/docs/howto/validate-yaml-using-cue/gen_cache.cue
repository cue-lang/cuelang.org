package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "E9PkkKj/F6tIZTiKzVbQ72E4KOehyQFqD4EW/s34vaU="
								"initial x.cue":  "Pdoq2TJiD2Et3+HGMyVopOltp6bVSWui1F79KF+y/a4="
								"another person": "SM2793svYUslS4dfVzmdqGqeS5SklsE8nwhrM9dzwuY="
								"fixed yaml":     "x4+F2Nay45++SXwN/QxXHNLKQM5D/ES+PiyDSk13Uvo="
							}
							multi_step: {
								hash:       "TUD94HN39VQKT8IK40DFTASUT9QOVS887MTIN25HGG8JQ866DOU0===="
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
											    ./x.cue:7:21
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
