package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "WKTolnbyEqPh72KtRCaksk/ZUjs4JwM/faMxX4lcmQo="
								"schema.cue":         "1b4fPwWajUX+hodBtMN1P7nldk6/Ew5JSNHiLuvnpu8="
								"split_pea.yml":      "geMnrt4SR/6h1QNMjQieWzgWO5XgXpEUxba13UUVNHc="
								"pomodoro.yml":       "VCm20o1flIlnELH4nkq+FxTIncF6bvlfqsaNUbbg4kg="
								"pomodoro.yml fixed": "kgQ+M3FBrcmIHBJXo4iJP8tx790vvR9s4GUQ1n1wlxA="
							}
							multi_step: {
								hash:       "3VPM6OGCLHNJFCT3NE69TRD6TA04B3QMEH4PR0TOIHFKKVS9EJSG===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.2
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
