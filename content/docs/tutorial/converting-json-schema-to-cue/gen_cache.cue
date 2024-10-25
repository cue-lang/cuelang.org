package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "INvJKgLjot40l1pCfuO2p8F3nzIgQdueB3aCnq+EHSc="
								"schema.cue":         "0i8zARfKoUVYCIfirsqGmDzm6V+Sxr0XWnTlg+xqOBE="
								"split_pea.yml":      "TVGmNu3wAFWdQrgNnpzhnWKNdsA+PXuaGNGl+Sy4CYM="
								"pomodoro.yml":       "3vo4jXfI0Y/4XH+MHIP1M/5E7OjTbzSuQhdfDUKUHpM="
								"pomodoro.yml fixed": "yszyl1vZqFbtaP350m3AdIAzzrQBW3RiBbUeWRQv4cU="
							}
							multi_step: {
								hash:       "FTH90GPKU213C9R9M9F0H1O5QH04GEQRUEGDLKS8HH7IOCJP2IVG===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.1
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
