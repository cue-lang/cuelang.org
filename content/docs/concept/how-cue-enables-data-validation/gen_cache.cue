package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "8MSv93txkZ30ajnSK0XMSgpGpOMEIHj0jtFQv/68m3k="
								"data: bryn (broken)":           "LK1YtQ/I0zoY1v2cRZ7dVMQv1LOMmGyxtgM0+xaJVzo="
								"data: charlie":                 "95QXYy/KrE2UzVh+eusjFiXm+49cUR3sKtckcbF3yz4="
								"schema: CUE":                   "QYoMPCS3TJCrpDD/xHanvcEHhX6BaebcGwrb2yA4weg="
								"data: bryn (fixed)":            "iW45dG9m+LQHnAeY9dX7GDhs+mQ25yZSxvFdRbhWmwU="
								"data: alex (reminder)":         "SXL9wj9g3f9dznURA4dJlU25y5pmRrpibUr1sXQjEmA="
								"data: bryn (reminder)":         "IXddIWPK/kZe6Lp6bpaQi6/iq19LQHQevHI/D1t7GGg="
								"data: charlie (reminder)":      "EPOpADHeoel5H0YEnKKTLttuUSnULDAS4UFA/3zg3jM="
								"schema: CUE (reminder)":        "9bK3Q3gO0wuE9WztJ07hBtgEx4bzN51M4/BL9WnvizQ="
								"policy: CUE (too restrictive)": "cIrxp2o/ecoKxc8ponrgN9m5rzq8oKUew9j0ULdfKIw="
								"policy: CUE (correct)":         "Jgb+295EyMN28VxCn8UBbjjDbmmC+YZqfgOmt87z2fQ="
								"schema.proto":                  "19tL+Lxq8F2NrcO3u9BiKHqJHPnJRNLUT/5ipbVJmJY="
								"schema.json":                   "47ixaIw1FKzJqnhmonnP8xu0Q1rmdhuufjBMPfg0Xes="
								"policy.cue":                    "wn/HrPg9MfaZ7buF0oRTtY3Zwzf7jknzCXBC7fsbSA0="
								"data.yml (broken)":             "LbCNukpjIKX+zrKea2B4hBn4dvBI8eqk1KsmANxKf1c="
								"data.yml (fixed)":              "tTNa4IRUTKA8jb8sdGT8/lR4Jvb3F3axwm1hmcfTPCI="
							}
							code: {
								constraints: "CMHuYvSoLV3RfP0+2/pIrrDwGCF/bRUpsSu7FIsBtjs="
								definition:  "C5d0NLVCb8RLPeR1ttUPlh1QBa6NlO4ZyNjThqhZaoM="
							}
							multi_step: {
								hash:       "BT9412RSSFV5H1V6HFPPC9T03BE0G1AIL0G3D1D5CJI6BKL3NKD0===="
								scriptHash: "I810RVUS4KMU003KOBIBKJ0OSCMTLPSLOID2M86CFKAO5BUPA5GG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
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
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
									exitCode: 1
									output: """
											aBool: conflicting values "this is not a boolean value" and bool (mismatched types string and bool):
											    ./data.yml:4:8
											    ./schema.proto:5:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (does not satisfy strings.Contains("25")):
											    ./policy.cue:6:12
											    ./data.yml:1:10
											    ./policy.cue:6:29
											    ./schema.json:9:22
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:22
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:22
											    ./policy.cue:9:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
