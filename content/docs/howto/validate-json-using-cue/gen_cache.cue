package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "F409+HKifTBEPg+TcCJWzqQdlGA7ZQzn/b4wYeE+YeA="
								"x.cue":        "DGWR73Olityd5vIBtIX3UvL4j80L/tq/XhBenfwVgv4="
								"x.json v2":    "zgbee0HYiTOu6++S8MKv9G7tJhy/UKKjj5pf7ArQmeU="
								"fixed x.json": "POFT9UBe53FjtB9c7aLvEkd36aEl6swxLYzPw5Qxop0="
							}
							multi_step: {
								hash:       "3416FOSS0E7G6JSDPGJ41QTDU0SP636G478HRP9G2BR4VLJSL6H0===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
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
