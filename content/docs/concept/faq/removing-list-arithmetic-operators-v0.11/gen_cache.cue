package site
{
	content: {
		docs: {
			concept: {
				faq: {
					"removing-list-arithmetic-operators-v0.11": {
						page: {
							cache: {
								upload: {
									removed:                 "uSfshMKoMG4URmufsN77uJ9u27Lyi5E36vxEZO43VJE="
									changes:                 "yqxyt43PFAaWbG0A4V4J0+5Ckx83MME/JNwQ+Swuw6M="
									"changes: updated file": "EP8BwH0c5sUGq/opqVnblgEoqA/21jJiBuTewI14sOU="
									"references: broken":    "64Tbd31MljVfhsMwgDg2ObaTWl6LFDaj7Z7Z2wiVA2M="
									"references: fixed":     "oWfIarGWtAx1aqn6ZCLfJ6IpASgMx73oWC/D+YG3s/Q="
								}
								multi_step: {
									hash:       "9NC4UQ64UGKGME6EURM410DVQLTSMNIQ7F145TJUJA8NVQDSGB2G===="
									scriptHash: "CQLN0JB91J0J500G73ET7JLAEUQ73QC37IB3PEFB4O462O83DV2G===="
									steps: [{
										doc:      ""
										cmd:      "cue vet -c list-arithmetic.cue"
										exitCode: 1
										output: """
												A: Multiplication of lists is superseded by list.Repeat; see https://cuelang.org/e/v0.11-list-arithmetic:
												    ./list-arithmetic.cue:1:4
												B: Addition of lists is superseded by list.Concat; see https://cuelang.org/e/v0.11-list-arithmetic:
												    ./list-arithmetic.cue:2:4

												"""
									}, {
										doc:      ""
										cmd:      "cue fix changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c references.cue"
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
}
