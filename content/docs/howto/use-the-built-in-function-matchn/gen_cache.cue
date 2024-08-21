package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchn": {
					page: {
						cache: {
							upload: {
								basic:         "pgKy7ZjgCtqS8DgsHmRsK2nBYeSjoOcdRjq7UmRXwOQ="
								"one of":      "e74o5Onp1OoAzepEchMnExs/A5wgHYhfqHaKLKp0cqo="
								"any of":      "165Tc+q1AeA6opEPagvsLc5/IamRMiypLlHULC0jPw0="
								"all of":      "pEr9Rh3V5+oYsvqeSR9yl5N9Rw+YSgc4lZ2Q6WAh+j0="
								not:           "IECXMjtkVDxqyNERUWzBzE5lKeYCVMhOyeeZhvNsEgI="
								"all but one": "XseOBFuulZdMc7zkzoiySQex9kJs3Y5D2GYncddt7c8="
								composite:     "IrMJLK5IergqI2YDo/S1xmQUqsIrM7ExisoQAbHPxW0="
							}
							multi_step: {
								hash:       "978NKB3V781GRRA9OKU8BJAKEEPOM692SUQV4BP3SPC3L1TTTA50===="
								scriptHash: "EDSSJ5OGOC8DLHJNB47L93T656CM9A2P0CMUJ477DN22OJ6TE7OG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.11.0-0.dev.0.20240820111527-0a41a20985d3:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0-0.dev.0.20240820111527-0a41a20985d3
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
