package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "eZGB5kAjPTnfN8wPbwNBd6t3dWQDw0Bj/YgTq0xxt2A="
								"initial x.cue":  "aBKOW4GCOFHSwUIoYxoLsRl+ZboKFO6zs9KZv8o7wBk="
								"another person": "GvSVYrZOBW6KlFAFrXTyKBjnEmMCw6Tj6CVHtXwzA1U="
								"fixed yaml":     "DVvZ18iBNh1uzjtcWB05U5U50O6vz9MGM8ntOZRUtmw="
							}
							multi_step: {
								hash:       "3D064QILQHNF3GMM2P79R685CR2E1COO6TL8Q0HERN66LP49LGJG===="
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
