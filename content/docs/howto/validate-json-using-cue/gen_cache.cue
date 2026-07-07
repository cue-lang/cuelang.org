package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "M0YP5AjdDw1dfFKlHUVlBWuKhefYbdLuF2VOt1RBQ/c="
								"x.cue":        "EmC6vem/hymO04TCaZwlsMQtWuLkTxwjJrnhP3B5cVU="
								"x.json v2":    "XtVz+Z7fu9ZqfEfNIjUlhCdvS2cF2Err9FkKxK/abhc="
								"fixed x.json": "b2sLH0yEO4rSVIABvHa5QVuRggdUQx/nuKT1fw4wvnc="
							}
							multi_step: {
								hash:       "8GAU19K4H7O8GTHPSTG4S73U795VBCK3BNIT7T49A3NJOU7T3IE0===="
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
											    ./x.cue:7:21
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
