package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "0qUK9K0bHwQ0N26jFy3OT7/yFRKgV38KDtI9NRlJXYQ="
								"initial x.cue":  "4pGPvURGafEUYx2+qydIuv/wzKKrE1pal8Shk5eAbXM="
								"another person": "BwNDUcuyPgNcqkecHL5fsx4QKIskpVySXp26y4Z4G6A="
								"fixed yaml":     "QPwmrFXAg3sb+CcawTb7qkKDlkJum4Xx0oIiDzQEcaU="
							}
							multi_step: {
								hash:       "9S76PLC5BT154KLOIK26RERQ0OML9BQD5PCTDBLG0A9NVPKL9FIG===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
