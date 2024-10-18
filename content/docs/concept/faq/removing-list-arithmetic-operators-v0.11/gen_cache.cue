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
									removed:                 "et+XE+4K+L2fNJFfh8bRqg9fqcsCwjO+KG4pKzjBGZ8="
									changes:                 "HZ5GmJFJ5Gln2U5lmnsKQK/vqLel/KiH6GAVHoLNs7k="
									"changes: updated file": "6ZbgapuzXfNEfHlXQFZ9qqfSomGnxyscdU+xiledDno="
									"references: broken":    "CgOlsrSj0mhDnpAxRkGb++fJAEz0U0+o6wZUzqsDrFA="
									"references: fixed":     "KvFx5fLYMsDC44GZYGDm/lGI3KzdslCBz9QbnfYsMLY="
								}
								multi_step: {
									hash:       "1E60FJ7TEIVA0UPFATT5GCQ0HHKCC9U2M5JVHSUJVFIB6E9S6F8G===="
									scriptHash: "S12BQ1V02RIRAP3H37UTRU45H1QO3JFI65SN4KV775V0P9NHKMIG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.3.0.20241018151444-6e0525b34633:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet list-arithmetic.cue"
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
										cmd:      "cue vet references.cue"
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
