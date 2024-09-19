package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "uat9MhBGY1uk6G8Ql1r19xRErkPzEj97VmcYOFHF9sg="
								"schema.cue":         "gUBBTFVLsY+cuXonKlE7bz1rnUM9K5zJewKT/7cWBDY="
								"split_pea.yml":      "QNiSR4xBJ5sM0ti7TkbXJ2tEfa3l+8jsAYPFuD/kMR8="
								"pomodoro.yml":       "N6yZ7IjrDw63BkXT6lwtIFGfN6ljrlOZ9ZnU3RLGLUc="
								"pomodoro.yml fixed": "badraPTs32FAPhCnb/dxC5KDmbYTSEkn1QrPJ5JZmR8="
							}
							multi_step: {
								hash:       "S3M2P5AD938BBJEGF4MJERVIG83J41L67VAHL2HFK2OKV8PK8GKG===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0
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
