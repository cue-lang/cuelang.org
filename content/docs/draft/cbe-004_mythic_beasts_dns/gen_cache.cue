package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "bsHPpl81TOcFjRMPvyi0gF+/U2OABH5oj5Hb075P94I="
								"2": "vjs0iwChjoEbRiuiy7giMhsiBHmSjBiSXkaHJknwQ6E="
								"3": "zf5vQawuZpyC0XaYT4kPRnI0wfx0TikJtXhEYYr8UW0="
								"4": "Fw8wwUYNgVJTk3isjKHGq5SQqz1+DD//GmaD8QIito0="
								"5": "QivHIqgn6ta9IAgovYMDyz7jsmnpo+kfMS1R8V47fXo="
								"6": "NFa9X2uhmuDxs3hd+2ivFDfGYAcFo4AtH3LQ9nTZ8To="
							}
							multi_step: {
								hash:       "S7BRCQ3PPTPRTCPMRSSK6Q1SE87EH47PSDN6BB85PNU7EJ665KJG===="
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
