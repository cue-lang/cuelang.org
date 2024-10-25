package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "X/6FeTtB7Jwg4/pWwE7R6k44VRw1S58SjfQBvLR8IbM="
								"initial x.cue":  "tq4HyPrQdn/Wa45stiOGdQVk5W6xc4TEvFv0JUjaMXY="
								"another person": "nkAVMfWSaJJvfTiK/vqfsUp6KPcc0NIyHd24XhMuGzQ="
								"fixed yaml":     "5C5PM6FTPfCcGBvT816spgbeaXcdoiVZC1GYanzLKbc="
							}
							multi_step: {
								hash:       "TSPJNCNIB64VGFPN6UU8V2AA2GISM7688SDU5K0G1I26HA7SPVF0===="
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
