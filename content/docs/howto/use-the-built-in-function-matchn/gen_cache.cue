package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchn": {
					page: {
						cache: {
							upload: {
								cc: "chvfJT1CvdP9vTx5tNhz/UIgiii9sxit+9eVHrVc31I="
							}
							multi_step: {
								hash:       "F8VH0QFNAB1161IK54QOFSEDVGNRH0HJUJ3EVEC5UG7LEF1ON2VG===="
								scriptHash: "99EV36N7LJU534NHAVLTJ9IJLIUJKCASEO4QJFN2OFF7C4PSTRQG===="
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
									cmd:      "cue vet"
									exitCode: 1
									output: """
											match.singleErr: invalid value {a:"foo"} (does not satisfy matchN(1, [{a:int}])): 0 matched, expected 1:
											    ./example.cue:10:17
											    ./example.cue:10:24
											    ./example.cue:12:13
											match.incompleteErr: invalid value {a:string} (does not satisfy matchN(1, [{a:int}])): 0 matched, expected 1:
											    ./example.cue:14:21
											    ./example.cue:14:28
											    ./example.cue:16:17
											match.defaults.pickNested1Err: invalid value {a:*3 | int} (does not satisfy matchN(1, [{a:2}])): 0 matched, expected 1:
											    ./example.cue:38:23
											    ./example.cue:38:30
											    ./example.cue:41:19
											match.defaults.pickNested2Err: invalid value {a:*3 | int} (does not satisfy matchN(1, [{a:<=2}])): 0 matched, expected 1:
											    ./example.cue:43:23
											    ./example.cue:43:30
											    ./example.cue:46:19
											not.singleErr: invalid value {a:2} (does not satisfy matchN(0, [{a:int}])): 1 matched, expected 0:
											    ./example.cue:76:17
											    ./example.cue:76:24
											    ./example.cue:78:13
											not.doubleErr: invalid value {a:"foo"} (does not satisfy matchN(0, [matchN(0, [#Foo])])): 1 matched, expected 0:
											    ./example.cue:80:17
											    ./example.cue:80:24
											    ./example.cue:82:13
											oneOf.multiple1Err1: invalid value 1 (does not satisfy matchN(1, [math.MultipleOf(3),math.MultipleOf(5)])): 0 matched, expected 1:
											    ./example.cue:86:20
											    ./example.cue:86:27
											    ./example.cue:88:17
											oneOf.multiple1Err2: invalid value 15 (does not satisfy matchN(1, [math.MultipleOf(3),math.MultipleOf(5)])): 2 matched, expected 1:
											    ./example.cue:86:20
											    ./example.cue:86:27
											    ./example.cue:93:17
											anyOf.multiple1Err1: invalid value 1 (does not satisfy matchN(>0, [math.MultipleOf(3),math.MultipleOf(5)])): 0 matched, expected >0:
											    ./example.cue:97:20
											    ./example.cue:97:27
											    ./example.cue:99:17
											allOf.multiple1Err1: invalid value 1 (does not satisfy matchN(2, [math.MultipleOf(3),math.MultipleOf(5)])): 0 matched, expected 2:
											    ./example.cue:107:20
											    ./example.cue:107:27
											    ./example.cue:109:17
											allOf.multiple1Err2: invalid value 3 (does not satisfy matchN(2, [math.MultipleOf(3),math.MultipleOf(5)])): 1 matched, expected 2:
											    ./example.cue:107:20
											    ./example.cue:107:27
											    ./example.cue:110:17
											allOf.multiple1Err3: invalid value 5 (does not satisfy matchN(2, [math.MultipleOf(3),math.MultipleOf(5)])): 1 matched, expected 2:
											    ./example.cue:107:20
											    ./example.cue:107:27
											    ./example.cue:111:17

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
