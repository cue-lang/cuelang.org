package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "rvUydClXIk4GGnTKjnzxu4NUmKhrR5VKxiQL3jU3dhQ="
								"schema.cue":         "z9boaKgKJBuaIgfs1gCAgs15aJGZ1+qtfiA4sYNemkw="
								"split_pea.yml":      "GQ+kHbIhsOrL4QPHrphCuH1L5owl5gdC/9kPLtL5l5Q="
								"pomodoro.yml":       "lA6fL8AdL/d7YkKY4ERfjKwVg9seMtWdbJv4Q1BotbQ="
								"pomodoro.yml fixed": "hNy5RkbLdb5d80WCre2ybMj/R0URjcn1cpxr7hOF1s0="
							}
							multi_step: {
								hash:       "31RDQMJEK76QFTSBDUTFU69O5MC6K6MGLFKPM8HQUPIPJNFU9K60===="
								scriptHash: "C4LR0D5POADT8TNNESICONGVCB5E89FSU7UHCQ06E31VTC5S7HF0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.1
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
