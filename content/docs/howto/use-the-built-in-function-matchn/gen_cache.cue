package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchn": {
					page: {
						cache: {
							upload: {
								basic:         "SfLeiaEtBbY2Z1uAKQxqPgZRnVnAigkNGVGGEjBd8Hg="
								"one of":      "KsOHLEak2geBiFpCZ8M02L0T0D2Jk24FUmKgfKRV94g="
								"any of":      "fLYBc+EKqae7YFdt/9S0VwqrhMLnQ/RVqu7wa9PnZ+s="
								"all of":      "y/gGG/+4Fu/gODhEr8q/Y07mwrRFDH5WJF6e6vtcdII="
								not:           "vCbSEI3lBLMhfGaEgSg5ycOhU3n8Vb+6GWR6uS2DniU="
								"all but one": "HVVlWZKcUdaGkpX6YiZnUXDmAPt1A/+jKEU2J3u/ASg="
								composite:     "TlhZD5Iho4AKKbK698YckQj71zwTj2P6ebS9oeSDERM="
							}
							multi_step: {
								hash:       "TOBO1JHJ8991VBLJJFK2M5CJVJB2E8NF5VAKNUH9ISLGTNVI558G===="
								scriptHash: "JUDK13N4VCGVDLNM7Q2I29M46032UM3OS69SQSNOUJML5J3ONPB0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.11.0-0.dev.0.20240823082259-4967eb4077a9:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0-0.dev.0.20240823082259-4967eb4077a9
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
											    ./one-of.cue:11:4
											    ./one-of.cue:8:4
											    ./one-of.cue:10:4
											    ./one-of.cue:11:11

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:anyOf"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchN(1, [int,>0])): 2 matched, expected 1:
											    ./any-of.cue:10:4
											    ./any-of.cue:8:4
											    ./any-of.cue:10:11
											    ./any-of.cue:11:4
											B: invalid value 42 (does not satisfy matchN(>0, [string,>100])): 0 matched, expected >0:
											    ./any-of.cue:11:4
											    ./any-of.cue:8:4
											    ./any-of.cue:10:4
											    ./any-of.cue:11:11

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
											B: invalid value 42 (does not satisfy matchN(0, [42,>100,strings.HasSuffix(2)])): 1 matched, expected 0:
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
											B: invalid value {x:"4.2",y:"4.2",z:"4.2"} (does not satisfy matchN(>0, [{x:int},{z:float,y:string}])): 0 matched, expected >0:
											    ./composite.cue:9:4
											    ./composite.cue:9:11
											E: invalid value [11,12,13] (does not satisfy matchN(1, [[],[],[]])): 2 matched, expected 1:
											    ./composite.cue:24:19
											    ./composite.cue:24:4
											    ./composite.cue:24:26

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
