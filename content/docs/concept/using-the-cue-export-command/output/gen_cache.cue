package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								code: {
									"default output":             "DYF0z+hxAiaRrd2S/I9GAT/AdU9ptkcQsmdFiEnSo1E="
									"stdout yaml":                "4x0Ha4nqJbn0amI6P+iYCx+vq1wVYsoNRP32qv/zI6Q="
									"yaml:-":                     "IuuwR+Wv2tu/CzD0/dsvaAf7ngLmEu1RimP8R9F/HRo="
									"--out cue":                  "u4zAo/fiu7yK8D4D7TWfxSK9pzEXSggFtfSYYHr/L3E="
									"--out cue no hidden fields": "D1iCdW4YNgPCbSqXKxyUJeuyLFhyX8RUPHfmTk4utZQ="
									"--out cue --package foo":    "wVwx+dG+zfKAOaOVwcQeBSMKpytZy50fQF8mICLPuKc="
									"--escape":                   "eaTj+5jUQJxBEzDTlnB9r0BktkrfnpobscHoEGBLu6Y="
								}
								upload: {
									"--outfile data.yml":            "osVUkVvxX/M/NGCuddjAyGAI6/UIbiUScN9o5XyWDts="
									"--outfile data.txt":            "c4dBlOBzMc2/Zl7Z31M62PpyZ+kftTlA5yAT9tzPkyk="
									"--outfile datafile --out json": "EgtDUhGiVpCOWsiZpWz/fO2ZxoRbNdxBu4r4QYfFjoI="
									"--outfile json:datafile":       "i5jwrZPW2JD0Bg9RYsQKzxpHQmzr3yxmVmIETivzh8g="
								}
								multi_step: {
									hash:       "8AS5TTKNGEPP9AET10US5JB1KH37G25COGH35S4HIJFKGUK7AKN0===="
									scriptHash: "TVTCOHK1K6IF54PI4CB62FSIBJMCMB1BAOO6SNBVQ897AIDDN7UG===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml"
										exitCode: 0
										output: """
												data:
												  value: A string
												  list:
												    - 1
												    - 2

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile data.txt -e data.value"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.txt"
										exitCode: 0
										output: """
												A string

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile datafile --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile json:datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
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
}
