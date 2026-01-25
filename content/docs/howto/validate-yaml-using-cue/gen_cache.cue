package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "ni4MV3IikjeenWQMHavEbTvFG43cXLO508FbfBJConY="
								"initial x.cue":  "BxvS2hmVmkHf++QcCPQhH5ziwCh0BYQWDrpIP0TV5WI="
								"another person": "oJPbezTsV6z2q9x0te4dmZBVeKa/AoBJVwYq2NTwQOw="
								"fixed yaml":     "CeC4xO6oFuf+pgwE2MrIEYXrP3fuNdzkMoGnvqMAlXE="
							}
							multi_step: {
								hash:       "63KHF0G2QDJ7BQ3SRLPLNK98ATGJH1AF6559T10BP0KTFFCA0OH0===="
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
