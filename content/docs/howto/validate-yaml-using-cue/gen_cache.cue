package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "O9dlAsYPlr+cdNfW8IXHGxND166rVSNrOdJ7//Oxl8Y="
								"initial x.cue":  "YJubQyH7BXCiEKmZcISBCNygeY1hicg8iJ9DOEOWQ1I="
								"another person": "3kEqIpvhlKKRaY3VQrWPcWt8n1zBfbDpkS9p8vuunMA="
								"fixed yaml":     "/umclwFNDi+ceNEWFhplTXwnNnLxusSA8eg8/6paQgI="
							}
							multi_step: {
								hash:       "UE18OJ7UUTHNO9K6CIHSC218PKCN4QQSI7S0ULFK2BVLEFQVBCA0===="
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
