package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "iHsY9kROfQYJvLSXybZf3/UolwKa7yEJDxts8MTZXEk="
								"schema.cue":         "1yqeKGCWEAFLn7MTKZuOxaVf+Zy6cctjdhylApsJoL8="
								"split_pea.yml":      "mJ2DCeasUsehCMEVYCXobhsM9sD34IoIPufXJy/2LTk="
								"pomodoro.yml":       "wKDs0Zj5SEt4b/ENEceGLpduUFqK6PN+Kr5YLYYrWpI="
								"pomodoro.yml fixed": "rDGXQxx/EVkpXJNLIPuflpve5GdnUo1asMyVeJnhB5o="
							}
							multi_step: {
								hash:       "LT4M10VP0RIFI2I7V8JNGIQJ9F7TT5I3AS0T2QPC9TT1SCVCGKQ0===="
								scriptHash: "C4LR0D5POADT8TNNESICONGVCB5E89FSU7UHCQ06E31VTC5S7HF0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.2
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
											    ./schema.cue:12:17
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
