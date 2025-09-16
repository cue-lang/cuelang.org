package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "xAMeolIwPq0warWH4bkKnRavAuujIBDrMoJF6hu4iGw="
								"initial x.cue":  "+JBzrsK2uVv926JcgV3k+sSCwgVrTH1AzzYyrLUqTXM="
								"another person": "Eq6Qz8iQJk8HL5CHw6OCRhLJ+6Kud/XoyhlqmY+eGzA="
								"fixed yaml":     "Zdz2v5mECflDBwEOpV0bccMb4bB431r9aZzFv+O6RVs="
							}
							multi_step: {
								hash:       "F38FUBOIFN5C67500U2EB0SJBNFIP0JLGL8HDQ5NDSPLRCUAU1C0===="
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
