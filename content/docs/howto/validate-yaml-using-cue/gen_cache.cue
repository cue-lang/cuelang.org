package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "SBZ/0IxlbXKlOgnAxKcYSTHGOFzBLd78X5H/thmIhaw="
								"initial x.cue":  "DG8IqjZxkvg2QCEPncZcFMMptgjHUPfo3jyABKCdnmQ="
								"another person": "8t6R60+/zwC50rNGRHvUgNc/ShpISqTjHgIXhzG+dEc="
								"fixed yaml":     "6l235guxkVv2dem4iDxQjkAxpKWuidZoXIJh6RRNR48="
							}
							multi_step: {
								hash:       "80T7303S3EC4ULKKF7B8227FTR9O45F3UQCTLK7J4KA8SBUPDSB0===="
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
