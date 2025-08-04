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
									"default output":             "ynaYBqLEwnGdwonx13Nhw3AOZJl40Deb61hVekn1zCU="
									"stdout yaml":                "R7Lmq83R01SJsM7ZRVdpcFPFLmEyDhW1HU5ZREYgCTI="
									"yaml:-":                     "vDVWSjOfJXmw5CWEViW2BtwWeJeKOtgVWgHwh12ryIs="
									"--out cue":                  "gf4YON387HsdWxFFFeRMMYVU5KSSNXHjiL/GQSv+Xb4="
									"--out cue no hidden fields": "D+sXbumNyaoPYWQvCCjRxRRgdtwaWsmw5PwMqyrgIQs="
									"--out cue --package foo":    "2Feq3mduqdaYgTlV3Mc53aN7yw8Gb9R9gO3vSMx7iyg="
									"--escape":                   "4T6mZzCsRk9fDF3nA0qm2yFYV97Igu3lq9tOJRWfcWs="
								}
								upload: {
									"--outfile data.yml":            "+VTYeYHJvJ1e9qYS7MGRXJ08Qq4fAlD6qZbbCALojus="
									"--outfile data.txt":            "aMpW62GW1/lzTA7CDHtUOesNWj9qnlCrFm0eYT7UWAk="
									"--outfile datafile --out json": "73F0AsYe3BhXrPdWDd92bvgce1MKAOEbjh540pTU+Z4="
									"--outfile json:datafile":       "85UhxdC/70qSnLMvb5I6dr9EhU5UAJ14F+2aGrJBW/E="
								}
								multi_step: {
									hash:       "N2SQ59KTRO18OVMVDLTHKSUCAHPQ7PARRO45MDNH5QLOQ8BI0OP0===="
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
