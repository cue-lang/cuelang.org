package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "dUvoQs8990sUt5geD/wE9hrGRsZam5GAbL4NOxXqRsE="
								"initial x.cue":  "r+2oVXlkEcPk6Bc9Hnf0XwSbyoTysXic/QJvxFPBaUY="
								"another person": "R7PAghBk/W8R8axlfTyda/XUDrFsKQXvcE0RlVpOuQA="
								"fixed yaml":     "UkeaXsrMmtqcX7J78KTGYQDZSdXG14cr8yAj6IsmeTI="
							}
							multi_step: {
								hash:       "P0JIQRQP1F213NAMTIOJC6MUUTGJIPR634G62652ESN4MDH2714G===="
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
