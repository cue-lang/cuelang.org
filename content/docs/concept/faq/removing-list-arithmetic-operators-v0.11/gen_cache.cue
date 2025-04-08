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
									removed:                 "xix0OETi7a7YnHdg0IgxwbDGSovIXTcgCb7WOxhQCWU="
									changes:                 "Z9NEJUIPyRE5dcQimOCM+uWxqxPybPoDlB+y8EbcR3M="
									"changes: updated file": "xcuB/qoF9irha/3itF/xrGxtT+lYTwmT43s+ADvTBOc="
									"references: broken":    "fmygXORrKh5ufAKj+rFSaUsYZ9kkGd8zcOtKVT3iwHY="
									"references: fixed":     "zeN+0KVa+m5o0UKReOTJrEmBquC3EjhHLLZJsuJqznk="
								}
								multi_step: {
									hash:       "7KOQDOKFDOMK1GFIBIEUOP90HDB6IJAUVVGBDUUK3A2NB442L870===="
									scriptHash: "SBEFDKT04I04B6RCD2P46K2LSE31D1LS9EPISLM626C7D6BAQG20===="
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
										cmd:      "mv changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff changes-required.cue .changes-required.cue"
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
