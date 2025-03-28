package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "yfbMOjFQte+qHjPNE8F8amkQ/LNMdnIfUq5sgCBgk2o="
								"data: bryn (broken)":           "rimYPP2xVRairc/Kc4sth1aqgRZHkKdtaG833hsD588="
								"data: charlie":                 "4iJFLC7U1Mvi5hgRNwj8roxEw62MLSlrhD1iuOiJuU4="
								"schema: CUE":                   "7sYQfOe22RB0iAC8IujSS3j2FJSLqVnKFv2Utw83lq4="
								"data: bryn (fixed)":            "QvtSqlIlbFQyincM75syLfO9fPqrs1yb/xIouIdMDMA="
								"data: alex (reminder)":         "9V71IYWE7aIZDmggwjWpS1nQufPYbXR2TmzHwPEAcM4="
								"data: bryn (reminder)":         "ktbe7L0ZS2yjBc2lOMH94NzhOLFC96GT5zFJ04Kj2F4="
								"data: charlie (reminder)":      "SZncTu4Jk9XpDknshaL1suCa1NWYC72co8+Auj3yEdk="
								"schema: CUE (reminder)":        "y9lVJD/ah7XUKg9iIJypWvu4OtSGg4h1d7YO2/9DzFc="
								"policy: CUE (too restrictive)": "XCVyGl8wt7JtN+8PiknRGqM4+ntPa5zmukTHnQaQOlI="
								"policy: CUE (correct)":         "YwMO8P8ILGZRdFEk6OzKF4W3jF4ZQGIrjLCAzLyCYRA="
								"schema.proto":                  "ZblMm7Mn3TuwftBS/U25J08MSbPyp7yD2yOdcAOGGmw="
								"schema.json":                   "b1QnS4oqkE6PMq1gd36ZsHWjl/p+2QipyecE99p5bo0="
								"policy.cue":                    "p+SOF2armSTOBait5U/swg3REWmMjiWqvZaHtlTuE6M="
								"data.yml (broken)":             "+QPHFAusUAmmvrAy2anaeXUOwdkc/wtluXRA7m5MTGE="
								"data.yml (fixed)":              "cITeNpVorDUGAdrDqwY2yMhgGRpy2Bwb0DTcYmH4oOU="
							}
							code: {
								constraints: "QUB/tQ64KLTdVogHlhF9jloTbo69zNo49aUa+jAnLo4="
								definition:  "42nnumvUy+F9uLPES7ApXiXjYrcxzRQ91ysrWJpL800="
							}
							multi_step: {
								hash:       "ISG4M1F7NMQLKH7CVIAN907CNASJE54KNEHE8RVRRC6L681UF900===="
								scriptHash: "5IRU0HUMAKN4O1TE41F2439MMECK8AS890TU89R3REV16HVJRUN0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											type: 2 errors in empty disjunction:
											type: conflicting values "cat" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:18
											type: conflicting values "dog" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:10
											height: invalid value 2 (out of bound >10):
											    ./policy.cue:4:10
											    ./bryn.json:4:15

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
									exitCode: 1
									output: """
											aBool: conflicting values "this is not a boolean value" and bool (mismatched types string and bool):
											    ./data.yml:4:8
											    ./schema.proto:5:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (does not satisfy strings.Contains("25")):
											    ./policy.cue:6:12
											    ./data.yml:1:10
											    ./policy.cue:6:29
											    ./schema.json:9:21
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:21
											    ./policy.cue:9:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
