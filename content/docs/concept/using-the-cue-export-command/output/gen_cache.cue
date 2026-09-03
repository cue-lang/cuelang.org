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
									"default output":             "n3PTlskilGHxZNskc88IbefMp14SHUrqM2eyXCWlpW0="
									"stdout yaml":                "BEn4sJe/DNA68TMMjOak2NE+PNwpnt2vAHFSS3WbkPs="
									"yaml:-":                     "R+ETnSX06Fla1NaveqswleIedc6mqcsJ6Lqjk0SRzSY="
									"--out cue":                  "sINAC6VAONYXn9PpNORJiEtXAC1pz1OSlP2pP1+TQ4Q="
									"--out cue no hidden fields": "kbpSrjVTqRTNHyrYtyv2pmowJ45HLLlEWjKOEdqoCLE="
									"--out cue --package foo":    "xrFNAznp+lkFGQ+612lObLLYshsWIslvygPe/jUehtI="
									"--escape":                   "3yvlRbxv2TxR5JN8y4KOUbjQjXIQHhM1OE24i8I+NuU="
								}
								upload: {
									"--outfile data.yml":            "xwS/9gfRkP+TPLb+34N79FdTCXTUcW5WyxgbP1yKNu4="
									"--outfile data.txt":            "1TJyyYUqTEd9Cs6dHKXbMZONlS37mQOVpi9b8FPHL0c="
									"--outfile datafile --out json": "aC48nRw1urQg3G47Ktr5PGaTj3sYZmDRaOqtjWguPF8="
									"--outfile json:datafile":       "RqCRUriZsfI51DROZyOSD1O+R+ii8ze5fnN/RQ9LUuU="
								}
								multi_step: {
									hash:       "2VQIF5TMIUM5LGD2JF3R7OR76MJ8RMS6P3KGMJKPIMCJ67JVSSQ0===="
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
