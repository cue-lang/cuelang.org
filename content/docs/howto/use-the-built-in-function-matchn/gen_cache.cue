package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchn": {
					page: {
						cache: {
							upload: {
								basic:                   "emzyigGF0N6hnkQHUTHUNI3jvNUKterWeqP28BVT8Tg="
								"one of":                "gEwzA35l4e3USJeExKlogNX7z/vtRzw9iDdAWsdg4OE="
								"any of":                "qXmNCh8e8uQhakpWGZY0mp1Q3Efj/kwZe9ssBZxSk0A="
								"all of":                "flgYjw0o8/g9Lip763gL5DOHbKHClI5dCwgDjnAYtDQ="
								not:                     "cUWP95vVqotcIXgDsbaImjvsZdSEJsNGSzSAahFDZM8="
								"all but one":           "XqvdoFLEsCAcanQ0zvLSDzchkjoH1MGg7vehfTlDUN4="
								composite:               "+3de3ynfajSwmTTCS0vU4VtD/XtRnDnVS4zKSP11OYk="
								"future: helper fields": "vxwEqgPbFj9WsJsfJcbvuRsOrfJZMGt52QI+AEpvdgs="
							}
							multi_step: {
								hash:       "P6KN1OMBDF1PVRQ0DQO4DG36IJ6VKJ9JDMV1EJO010AV2CENH5SG===="
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
