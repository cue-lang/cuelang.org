package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "6rgOAryJjYY5uSk+B1i7by3U8+qh1SMl+YMYP9LKBD0="
								"x.cue":        "2kMZ98byeFwKz0UGT1LdcCD4spT4iCeuG6HQHO6yg/s="
								"x.json v2":    "zYvpVlSJuAj2QE1y/kI8GJiRwbq08KYk2UmfQR61yss="
								"fixed x.json": "eMmwKq9H5w+f0w2Z9V046q/reQBWiCKrbmW3HQE8UJs="
							}
							multi_step: {
								hash:       "BPT8IH7PD9LFAPIJ9DS5SUHN7V2QE44VE5DFNJB6ELFSNPP517C0===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
