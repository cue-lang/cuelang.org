package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "kq93/mTlu3nu963k7gjfAAt9nIYRWAqVvCVmoTkhHb0="
								"schema.cue":         "26J2GsPe6QmMtMyHAn0p1Yk9Omq3xXjN6YGch7mDAhU="
								"split_pea.yml":      "us5CE0KeogZ8C6CyE2xurPEJss0b2TBgPJeryy/Qqzk="
								"pomodoro.yml":       "3aJ3UTaOOYVRR3/CU/f2ky5IVT3WQHJe6QK5awHFQkI="
								"pomodoro.yml fixed": "MFXprnWiwzJGQgPyyrOX2oSi89hGOWnfhHHtgi+VdkA="
							}
							multi_step: {
								hash:       "20QSPSKBTB5TRPGUTQ0RENQM29H3CMDCSDCK08J4E4BJCI5A8680===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-rc.1
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
											    ./schema.cue:10:16
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
