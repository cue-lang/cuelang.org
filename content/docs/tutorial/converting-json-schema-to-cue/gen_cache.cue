package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "HphSZlSiHHGTxr/FskoLMPeJQR6CJ/kzT32V0zAemX8="
								"schema.cue":         "qZDHdGWb+a0y5neGOf9i6BGolIEi8r3DFzD7KIxqrgw="
								"split_pea.yml":      "I3ENTrGeCC3j9utf2ckAGu6D+fULk5WmYHYrlEvDs+s="
								"pomodoro.yml":       "unAhAmcNI0qaEtKh24mwbVs12xG5Q8uV5XN3QZrzu1g="
								"pomodoro.yml fixed": "dmRXV5bIn8wHMG0UjGAP85LSZaZ6owjlHq+g0xl25c8="
							}
							multi_step: {
								hash:       "G7PRH11UHKR0OQ51755GL6N0CR50PG92MVGRRDIEM43O2F4VEC70===="
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
