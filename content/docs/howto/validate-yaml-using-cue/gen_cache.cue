package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "uROhPvzgWiP4v97ANoThr1IpCX5YayRsso33CqYGNJY="
								"initial x.cue":  "EGyGpESOwStgmAEnMKbWZRlwmb4lAYeNh+wGr8l8wvY="
								"another person": "aKAu8DsIa9krHnQnWIj+Cg5T4yFOH7OxnsFprJrchHI="
								"fixed yaml":     "OTchioCpgydBS8G5kLkmrv5n6PG+lhcDNV653PoLhdY="
							}
							multi_step: {
								hash:       "R8CH5NDIO3AJ9T8BJLSBPGEEABO68RI5HCF76DJESB632NRAB7KG===="
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
