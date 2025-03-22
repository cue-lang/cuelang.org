package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "X/64oFxb3lekz2Wam0giTd6oqgayyVq2DEFsGo1CFVg="
								"schema.cue":         "aeAz2pJLAdzuCDTDYIQ+obpJg8S/GHhw5WwdB+diRt4="
								"split_pea.yml":      "jyy+rJ9dGEsRkb0VNoPvL+VKMTIBVduvdj9W0ASInH8="
								"pomodoro.yml":       "OLWHH6r9Ro3RtEi45pSMdLbWHJ92s73K42z2rmv9EOI="
								"pomodoro.yml fixed": "kSO8dcBegU2tzt/WYYLI6vVcR/tdJyxvkPaGXEe55jE="
							}
							multi_step: {
								hash:       "EUD8H97B4L60FNDVCSQ8FI9JH56M3A0VN1ECFOOTNGMOIVBFQ9N0===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0-alpha.1.0.20250322080417-cfbeb48088c9
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
