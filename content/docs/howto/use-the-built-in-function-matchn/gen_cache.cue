package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchn": {
					page: {
						cache: {
							upload: {
								basic:                   "ole7BqNNaswAMwa9WyaGhHSqdSkIH42Tj+BtgytBIlM="
								"one of":                "n4b+Lc50UQQSFoY8BdF9ylvLVN7S6fSxHbu4ZxLZOhg="
								"any of":                "C7J9QTTq4eWVLmWoj7vI5oItE6SLO8lYSCLOCsmV2Qo="
								"all of":                "pHFQr5eAYcgFQCeFnfH0kVWvQuR4hUQiFcZzY1pNk/M="
								not:                     "ft1dOGFQ068FPSfnhaENYuzQpkML6kPL4XQMe8hS4Q8="
								"all but one":           "/NtetS9+FbXCj27aN3/WgaRkf3g/92R817tVqPnqUvM="
								composite:               "jhoB+AqgHXtFQki7sLGsw3Qu4dQ/YunTLyRVlCFeiw8="
								"future: helper fields": "0IvAR5cyd/l0tEFHg/GIZN6sUNanXf0M3lzD6ZFY4QQ="
							}
							multi_step: {
								hash:       "JDDAH9300SQ0NBPUAUERP61EE00TU9EE2A7F5E9VH6G719KAJH6G===="
								scriptHash: "92UUH30PSA7165LFFMDCBVP4VKFABQ7283OVLHR98QESLERPBV30===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.11.0-alpha.4:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0-alpha.4
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:basic"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchN(1, [int,>10])): 2 matched, expected 1:
											    ./basic.cue:11:4
											    ./basic.cue:9:4
											    ./basic.cue:11:11
											    ./basic.cue:12:4
											B: invalid value 42 (does not satisfy matchN(3, [int,>10,>100])): 2 matched, expected 3:
											    ./basic.cue:12:4
											    ./basic.cue:9:4
											    ./basic.cue:11:4
											    ./basic.cue:12:11

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:oneOf"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchN(1, [int,>10])): 2 matched, expected 1:
											    ./one-of.cue:13:4
											    ./one-of.cue:11:4
											    ./one-of.cue:13:11
											    ./one-of.cue:14:4
											B: invalid value 42 (does not satisfy matchN(1, [string,>100])): 0 matched, expected 1:
											    ./one-of.cue:14:4
											    ./one-of.cue:11:4
											    ./one-of.cue:13:4
											    ./one-of.cue:14:11
											C: invalid value 15 (does not satisfy matchN(1, [math.MultipleOf(3),math.MultipleOf(5)])): 2 matched, expected 1:
											    ./one-of.cue:18:4
											    ./one-of.cue:16:4
											    ./one-of.cue:18:11

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:anyOf"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchN(>0, [string,>100])): 0 matched, expected >0:
											    ./any-of.cue:10:4
											    ./any-of.cue:8:4
											    ./any-of.cue:10:11

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:allOf"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchN(3, [int,>10,>100])): 2 matched, expected 3:
											    ./all-of.cue:13:4
											    ./all-of.cue:11:4
											    ./all-of.cue:13:11
											    ./all-of.cue:14:4
											B: invalid value 42 (does not satisfy matchN(4, [int,>10,<100,math.MultipleOf(41)])): 3 matched, expected 4:
											    ./all-of.cue:14:4
											    ./all-of.cue:11:4
											    ./all-of.cue:13:4
											    ./all-of.cue:14:11

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:not"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchN(0, [int])): 1 matched, expected 0:
											    ./not.cue:16:4
											    ./not.cue:14:4
											    ./not.cue:16:11
											    ./not.cue:17:4
											    ./not.cue:18:4
											B: invalid value 42 (does not satisfy matchN(0, [string,number])): 1 matched, expected 0:
											    ./not.cue:17:4
											    ./not.cue:14:4
											    ./not.cue:16:4
											    ./not.cue:17:11
											    ./not.cue:18:4
											B: invalid value 42 (does not satisfy matchN(0, [42,>100,strings.HasSuffix("4")])): 1 matched, expected 0:
											    ./not.cue:18:4
											    ./not.cue:14:4
											    ./not.cue:16:4
											    ./not.cue:17:4
											    ./not.cue:18:11

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:allButOne"
									exitCode: 1
									output: """
											B: invalid value 42.0 (does not satisfy matchN(2, [number,int,>100])): 1 matched, expected 2:
											    ./all-but-one.cue:9:4
											    ./all-but-one.cue:8:4
											    ./all-but-one.cue:9:11

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:composite"
									exitCode: 1
									output: """
											B: invalid value {x:4.2,y:4.2,z:4.2} (does not satisfy matchN(>0, [{x!:int},{y!:string,z?:float}])): 0 matched, expected >0:
											    ./composite.cue:9:4
											    ./composite.cue:9:11
											E: invalid value [11,12,13] (does not satisfy matchN(1, [[],[],[]])): 2 matched, expected 1:
											    ./composite.cue:24:19
											    ./composite.cue:24:4
											    ./composite.cue:24:26

											"""
								}, {
									doc:      "# This command currently succeeds:"
									cmd:      "cue vet .:helperFields"
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
