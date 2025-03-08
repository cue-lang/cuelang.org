package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "6Hcm+nLF8YAnY0Gq5k7P6N7R892waQPjWDcLxeTYYfw="
								"schema.cue":         "kSEO06e1as+Fkc+w/cRpdQRHCj1kvtLkvbVn2Kx7MGM="
								"split_pea.yml":      "bdLFYODBkhP1WBYqySD7Nq09v0XzpJtPQCQG77TxysY="
								"pomodoro.yml":       "6gsdcRxFwdMuQCCFgfzJEjVzqEd/YqfzSu/7LnN0MEA="
								"pomodoro.yml fixed": "615eK4rjuR6uJODwRZUmOQaw98s2BRWUpYWdSFHO3ro="
							}
							multi_step: {
								hash:       "JOAMA9K6MC6H3L09QP1V40RNDML574UGTOJO113KR5DH6SA993VG===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u .schema.cue schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
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
