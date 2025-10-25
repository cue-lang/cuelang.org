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
									removed:                 "m+I2eG/sl6/KejMk8XgNmKhnVp6AVdsl2BqtLVEze9A="
									changes:                 "76tBlDrbj3YUkBgUSaVKA/XtKzOfJ7CDE/ZNMKP2boU="
									"changes: updated file": "ckiCLsCobLi1UoPhiFKaauiur4dOWJZym9nStyX+q8M="
									"references: broken":    "TdqMDHqt6MrcelwpQKG9pdK6KG9026d39QmOwsiiQmA="
									"references: fixed":     "HsuOCjaYFQT8GSyhOMXcWhr/IQlSBWEBVBd2jUgI/20="
								}
								multi_step: {
									hash:       "E0U1FOK38GFFO05OJKVH7G238DNR5M593VMDEOO0O293G13K1E40===="
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
