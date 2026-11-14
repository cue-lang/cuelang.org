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
									removed:                 "FconSX7utFQmzgY70YcKUFCp27q0zUnin1NaA3aXgTg="
									changes:                 "0XmxEmPqUl/4KdnLQgHDkgCmWcx0Xp+XGK+OlvEoRso="
									"changes: updated file": "Nvda6hWDqf1v6vs4BPMDoRzxKf5Kwugkdpi9c/LmGUE="
									"references: broken":    "8zJy8b+M5HCaE9yK76O8lzMHEDbkJL6qV9GHpRIi9AI="
									"references: fixed":     "cr6DzF5r/4LGP+BGbb2KQ3L6Enc4Tn4v29WU81uzHV0="
								}
								multi_step: {
									hash:       "VG9DVEORRMV223S66KLCP27AJK92GOJN6ISVPVVAE5TVTIMJDH4G===="
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
