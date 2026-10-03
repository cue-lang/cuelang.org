package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "7BS1fqIsZOdMRH4zcJuNunHnXqjpGHnhvjffkZWtwao="
								"x.cue":        "MS5/o75oFaLRSuli9NaRYZgo96OUVjfx6M/KZBuCPL8="
								"x.json v2":    "28djvpZQIYgMyJ7n1oenGZ1h65NHMKd5Kqu+1kq8dbA="
								"fixed x.json": "8/LmzaVnnzJzRYOUgfVZWQ5PEqI0nGSUdvF8sBHaPuM="
							}
							multi_step: {
								hash:       "AT21MI5OS0SJ8KMA0SL0HHE575LN8TM0TLB4QRF4ADUOGVVSABL0===="
								scriptHash: "AAA3CVDQRKSCMFV7CUP90CM199MG6USVJE9DE2KGITAA48SRPHGG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:25
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
