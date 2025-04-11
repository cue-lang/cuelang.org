package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								code: {
									"default output":             "lepCx86DTGaJWy4ZFyPqWDfEoe7eWmtp9kG2SHCYVtQ="
									"stdout yaml":                "r1MB9pOzmKa4/NASmCUfxEfqOx8D4ExSL4304s/MU1w="
									"yaml:-":                     "TYA5+wLbue0iBnWUXMg05PYO7jzYEZzcw+/d9bj0NUQ="
									"--out cue":                  "URbOm7BKilUSsh+/VsqSovZMG/JniNHoNH3wPfTiJb8="
									"--out cue no hidden fields": "+c30lB99S2qcaH5hnTbagijhtDDeOKcfw+dQk0g0qPw="
									"--out cue --package foo":    "yYBrI73jaBnh4Dc3KtUzAT3L+JsUdaGCnwUI6a2x/cw="
									"--escape":                   "EPLYMMa45J72OjGLWdzbSXZVFaEcxm4snLtDEUetS1w="
								}
								upload: {
									"--outfile data.yml":            "zef6vhGO2F8r95CTUxdsMOM0hm/faDrozNdtPVmn49c="
									"--outfile data.txt":            "6qd4b5QRQPL8sLFhoEpEcfg/sOyWwQ3PLduD36n8BNc="
									"--outfile datafile --out json": "WMhXUXouq2yXllZCCiY7DT0Jdz9JfplpM73oIFuhLOM="
									"--outfile json:datafile":       "0b89WKvKCUi26jyLh9/sqlLX+2aLjmMSW2wNZmdtJb0="
								}
								multi_step: {
									hash:       "T7AE8CNQOJFO4ERAD76R2IKPKDFG9JMFPODP7L4VDTVJUCP9552G===="
									scriptHash: "TVTCOHK1K6IF54PI4CB62FSIBJMCMB1BAOO6SNBVQ897AIDDN7UG===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml"
										exitCode: 0
										output: """
												data:
												  value: A string
												  list:
												    - 1
												    - 2

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile data.txt -e data.value"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.txt"
										exitCode: 0
										output: """
												A string

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile datafile --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile json:datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
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
