package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "9Ju6Z1dNtfp9O3qMJFsq0b/lxZ6q4hAUM6/Jhkb+rng="
								"schema.cue":         "5G+rGK4siYjH6ipXnv6KjCheK6t2wgX5e3prO0d34Sc="
								"split_pea.yml":      "pSuK/Bw26zqF1hAoiQmXXpDQ1Tu9L8dm6h62bhjEVOY="
								"pomodoro.yml":       "89d2bdEmireWb1a/cGbtVDEjfHKF0IAXVqv8u/bl6i4="
								"pomodoro.yml fixed": "CYxoizBwnv1Og5XNyZVkGAPUab5iVnu8nWW+IAx9jvI="
							}
							multi_step: {
								hash:       "1QU95D4T6NUSQA2J349395NDGC0O7FQBCRPL30UJPC3VB0BDBQF0===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0-rc.1.0.20240814100303-dc3ba30322ca
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
											    ./schema.cue:10:17
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
