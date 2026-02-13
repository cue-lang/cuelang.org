package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "o7EpY9HD6u1NpubCwtFkc+CW6y+16cTT0GIgX82DhDI="
								"2": "Fyr8ngkfkYRiqlV/VMX97SRnY0xy1S7ncRRbCLmb/oE="
								"3": "BNXwWUzQeUQuekUoObnSRm8zgjlBwWYTyRRm5zEvI4M="
								"4": "BWIeUqvzDm8ATS2A4gIm/AxXCh459ww6L4ST3WIghZM="
								"5": "b8aDEYdFMW1iWR4RC1CK/0H5LoUx01bpUcHxTp6fGfg="
								"6": "r1yEhN1zh244hGO9g72o7aSNeXUU8PM6FG7yi/U5JF4="
							}
							multi_step: {
								hash:       "BPGMK8F0U83NFU8D789REUPQNR7H7OOOTU2SIKR44AECN1TIRJNG===="
								scriptHash: "8T5T0B0K6S3NGIIOLM9255HN4DPN78BO9MK4UGDNESVR2HJLV9MG===="
								steps: [{
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue cmd dump
											"""
									cmd:      "cue cmd dump | head -20 >6.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff 6.expected.txt 6.actual.txt"
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
