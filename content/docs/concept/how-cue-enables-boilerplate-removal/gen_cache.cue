package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "g3uPLiXSYK4DLuWAJSfSK0eZHR624Am95pgn5ABZyF0="
							}
							upload: {
								"baseline input":   "wpyC3Qr1M/IRd/cb+DTzS23psA6uiwgEKrn1lju8UOg="
								"baseline output":  "RTyJuezHfTCroDCt8rAWYJRv89/mXoHEzjIzgJQ+z3I="
								schema:             "YcJvj/2o1U7plZDFSxUldDv453sPfWjLIBdsvUfuTGc="
								"schema reupload":  "luxB0VHD7oPnWEpG/PplJEXAZW2ZYVT70hqfszExOrc="
								"schema output":    "93bsXlKPPlGDG3V6MM+5e/cUnn7xZhUecwqhZqQZl7k="
								defaults:           "txJ/Zi3dXct3BxekqzmAC2jY9WVn2gL23tFwM8FSPos="
								"defaults output":  "JzRAI85BIu5Ltcb4/EbDSd3bG3jCk24f/33NwcKz1XA="
								name:               "3utBGafLWDzWkswE7xMnFKu7mGSLVsITsw8cibJg56I="
								"name output":      "CJNRy0CZh62O/rTIojb7AwjVgS36f92Cx233v+fJMbs="
								"extra app":        "CeTxXLNfknQdPwzMfaiePpC78xxEcPwGDpaGgyiITeE="
								"extra app output": "WouLd/7r6MwcrK0czdXlb7kjfLXD4cCnOeeJpP+AnRg="
								"pre-trim source":  "KXq1mQMFEebD5bJRpU3s7Ii30fph1+uCig+pDvgmrrs="
								"post-trim alpha":  "K8RNtAdBrbMYjBzeGFkVPedsnilqDj4KPv/l7afH9vQ="
								"post-trim beta":   "C69MGtKeYOa623EkQYc2ctiNzcBBRmNr4OktqLGHpUM="
								"post-trim gamma":  "t887SKu77eO+PcEWJSYY9WzN30zgnww5puasOgTPmkw="
								"post-trim output": "I7NVH8Cpv4BNo1Ab0iZlM+qMJVEmAjPxCvly9slyixw="
							}
							multi_step: {
								hash:       "EJ13Q7BOBKKJ52ML98FENJDGIGLKIUF1OSPES2LMKBPSG2FLGLQG===="
								scriptHash: "KOHOSQ50PPFAKGQVSRD4I3Q7TU957F05QL50M7RAI9OC7ASE4J9G===="
								steps: [{
									doc:      ""
									cmd:      "cue export -o configuration.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 1
									output: """
											app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
											    ./a.cue:3:13
											    ./a.cue:6:12
											    ./schema.cue:6:13

											"""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
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
