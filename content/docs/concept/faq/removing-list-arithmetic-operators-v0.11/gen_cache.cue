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
									removed:                 "pjYG5D+6W22PSNBkPfuYz01X7NH1EObZYirYvtwLBiM="
									changes:                 "peTTKW1+2GUm04yEqEFVP3uJ72uJ58OFZbQRWVuaVww="
									"changes: updated file": "XNU1BoymDngBEp1KXtzgGY2+FiuBltlW17hrh+izZGk="
									"references: broken":    "KD3roA0QsbaXXpQOAtdz1ucJqD8hVdTw+OPHAfF5d6I="
									"references: fixed":     "IUqgl14ktfcqXw3WH8hUOeq8ceap4dC2jfc+F8XMPMg="
								}
								multi_step: {
									hash:       "DR4M3TBT9BBTRHB2KDBBU93LB1MBJEFD51IF0NB3DUCR265MG3QG===="
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
