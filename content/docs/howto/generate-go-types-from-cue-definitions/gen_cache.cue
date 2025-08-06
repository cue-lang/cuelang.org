package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "HvmZVxbn1xIMSE3+xfc+Ibk1f6N0MWDfmUSYXIct6dM="
								"cue_types_gen.go 1":     "IMaN/Nw6eMkh9GZlXP3FLVSJZaMXgL9i3HFkKGE/nEw="
								"example 2":              "tRajnYmcuFRpbHf7AlryJxilIKVzsj/PSUIm4grMB3s="
								"cue_types_pet_gen.go 2": "dtK6sxxW5L+EZoeiMf6dOf1UyA63ADQ9Pw7d5iryi40="
							}
							multi_step: {
								hash:       "QL4L9ACP66R52LQGIAACQ8RN3LTGEAUIRM7QI40GTIHLB5KC3UIG===="
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
