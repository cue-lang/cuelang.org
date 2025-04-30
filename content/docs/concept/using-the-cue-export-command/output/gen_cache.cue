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
									"default output":             "1jyFDHRsUUeGkIsvN+I45FSlJiOv45FqkGliupDQxts="
									"stdout yaml":                "QEhhF/VJOF5i7MNlVAtS1pfmBf3wJYWDri4WouIOw7Y="
									"yaml:-":                     "GKDbQPLeJJmrOUv9Xd64vTixxXvSzMsgdmJ0F3MsYwg="
									"--out cue":                  "jA67+TjuiauQ/Gsb1KHojq00ZciD0uu4zpJfyKInnNg="
									"--out cue no hidden fields": "hm8MTvLYoWn6ESRVfKPIXDKufWxrSNDNj3FsHQ6l6IA="
									"--out cue --package foo":    "HoYmZSc52jaSb1IJRtL2D/zM2/K2yY09hQss5QQPGwg="
									"--escape":                   "cun+y/fWPQShf5LrpWzDqQe9xBx1AcCuL16cDQ2B23o="
								}
								upload: {
									"--outfile data.yml":            "G1xHU5XMP0dP08m6ufZfGOfoIbufZlYxOnfjF6W97Xc="
									"--outfile data.txt":            "k5gyg+3tNuGRLVFiPeqd7M3MZ9GrIkp7pNCfUK1Yz3M="
									"--outfile datafile --out json": "+9zr0jtw9ShRdlQrsP9NwTfcHiIfL2f3OXL/FF7qcEI="
									"--outfile json:datafile":       "TOcRaFLuDMRMj/9LLUVSCBQEDKGE5fcd29ZrcXHqE6U="
								}
								multi_step: {
									hash:       "JEQE1GNPRFAVNB71FFQO7NS4LRLOC9UUH7DNC1DJIC9Q4V35HTP0===="
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
