package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "oytrP1fz4ewG/EPJRXFMPH3d6F3J0ZYO1avTv7mSUvc="
								"initial x.cue":  "1YMCUC4YU8pFk1/JupfiXSYHROZu0EES08NfDWHKqRg="
								"another person": "fMsdQ3f2+LqP417ofO1hWMmYNm/pJcXd6r86u0qN9kc="
								"fixed yaml":     "tyff5retdHRpBn7WEOTl2oDBOwXohXIKiL86uHC/3mM="
							}
							multi_step: {
								hash:       "E50EHA6EHO5KVIHT50DE4C7VLCIQGD8LIIH5UQMTVS7VFLGMO7V0===="
								scriptHash: "75KJ4AHBHNRFCVEJ7F6K5S5JHRCITCNDLFCKCCC0UDN603TEUKO0===="
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
