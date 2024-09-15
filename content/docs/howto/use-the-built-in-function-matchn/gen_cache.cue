package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchn": {
					page: {
						cache: {
							upload: {
								basic:                   "Jsm5mpfGp1IKOsASNISXakhkZcA4b6tUfvq6iQQF6Eo="
								"one of":                "tequm4/Ap8a3/vrDqqweBGWotzwQ6Ol/rYnz0W7p7JE="
								"any of":                "3rR0z6QDqnwA/DKj7b8Y9PVxCduJAnhBAbh06sGj44U="
								"all of":                "+7IMtrpoxiVE9BGIt8PmWEXxCSV6BzFbd2m7x+o0Itg="
								not:                     "3zPwgQwhMCMRC80buowF/nkm/STAshQxfm8Vth0feQY="
								"all but one":           "bqcGE4XpWGtxdp4eCU5a6sRG5RGvNLeViPRBYrRpdws="
								composite:               "ykdl/T2acLq29gYQtgZg+oUJtBQhWeJJZISnO3W3AEA="
								"future: helper fields": "6vvSaLG4DP2Aq9ld5yaAA7eSrHTzzSaTuzcNrtlEpC0="
							}
							multi_step: {
								hash:       "6G90PL0SO2AB1JA6OUFBM4SIKU151F9VTHIN4J8R7VA3065ICT70===="
								scriptHash: "BIBTM3M6P5Q255R5F3VMD7IPESA01O0DK832L3QM72FEI5B3N0J0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.11.0-alpha.1:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0-alpha.1
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
