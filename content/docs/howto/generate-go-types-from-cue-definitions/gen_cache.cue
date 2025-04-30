package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "MwLotzyhhNfLLuXFm1NYBL4VyJf86ClF16dt8hml7Jw="
								"cue_types_gen.go 1": "xzjJ8SsqiK0uAVzhdFkgXCn/wNxIkt4XxoP++eu+L3g="
								"example 2":          "wwzja07wJYGZBarEzkU7jR2/DRgGBnCkJzNOFCL/Miw="
								"cue_types_gen.go 2": "iAcpCw/FlSZJ5c4T9H/ZMgWYxRsbmevr+3t2xG3BhWo="
							}
							multi_step: {
								hash:       "4MTTD6MDVQLULH0786KJV9OGVIP5PLIGTBJ31LCA31IG5EN3FOOG===="
								scriptHash: "ENTKF17DD7DNV7030J6UPAS40QU1DIO156V282TQ7OB9E272PPE0===="
								steps: [{
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c # Check we've not encoded anything odd in our CUE."
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
