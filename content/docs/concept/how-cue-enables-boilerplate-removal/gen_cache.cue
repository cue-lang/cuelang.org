package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "+f8IDJ357ZeIz5T/Z+tb+n4RZkxdSgXQgfxiScvv1gM="
							}
							upload: {
								"baseline input":   "z20wro6g9bX2J+xuUWJzMJftXRtVCldGcWeLjZYAFsg="
								"baseline output":  "SXRX4vWdkMejFiHoEjTDafNs3nTpsMG4xCHZkNLr/m4="
								schema:             "cmvaB+X1ZLgnlWvC0pLVWo0LJW7TrfII0uYTSBw1rpk="
								"schema reupload":  "Tn57nSiagPypypscuRRD6hRmAyLW+lxIa/fhnpmS6JA="
								"schema output":    "9h6eRrcHe0bUzdGMUE6XYtAatUgUJo5G5XrM81sodeM="
								defaults:           "7G8o1LQ1G1pSIGWXef2ED4d0IhPCTYezKUOei/4eoOI="
								"defaults output":  "+5Lhusx6AKnm/U98qTMBSwK+l53VyJtbcIP1nJBzyHQ="
								name:               "tnqqLmpGRp4Hb6h6hdYFtht2hkySJBNHKHcG3hbiN98="
								"name output":      "jCe/NYLfIDzd5vpTASGB4bmsi4xCGVrC3TIozF21kIE="
								"extra app":        "w/GjhgWWRsLwmHTqyvuEfFIMX3oPkjwROU4BiBiAAjQ="
								"extra app output": "pJb38S1RpXrB783OqAoDS72V05FOHRm1tAjA+s915OY="
								"pre-trim source":  "28UX8tIlcP0NsSt01wRIliLcb0inkZWnBvrNNyGzEO4="
								"post-trim alpha":  "FM9YEZnzqkDjgJzJGXc0D8JB1Cj3O2waucdCnIllPOs="
								"post-trim beta":   "SMslVGIWYxvJWQvK1e2wTGBXcasudvDe/nbabprJDqk="
								"post-trim gamma":  "8JiZhezm62811vKSqZwKJ/RgcHPYpSTUy5E6xVbVT1I="
								"post-trim output": "cmXuU31JRdQz3TmOeKNll+OB5SRa6LaA7xe6kFT0B9Q="
							}
							multi_step: {
								hash:       "VPIC9LEAGGDSM9R6HJ9KD3MTPENTHN2IQB3ADBHB914HEQF23UD0===="
								scriptHash: "JIPADP79TIMUIMVVO8STGAUSB5BK8PD9HO8VR1AGQAL09MO36AU0===="
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
