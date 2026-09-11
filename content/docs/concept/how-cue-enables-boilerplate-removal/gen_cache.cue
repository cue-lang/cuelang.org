package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "laJXZkayUgsNi8lbCBMepQsJd4AAjP9LyJTXBz8tPoQ="
							}
							upload: {
								"baseline input":   "FCpzVRY4bWebCJ+vmKLEXxadoi8W03dXVHraTz73szo="
								"baseline output":  "bCTTQqlkkV/Pjb7PfJ+aoSDblp3txYdPy4VzxxJOmTs="
								schema:             "0CzIVEbBcKRJ9okNvpbr/861zcPb7NBodmGC0wd9wz4="
								"schema reupload":  "dDXnCKjvBKqMIU5MJZOIaRho9xBEHPavWCjiZJDWt4Y="
								"schema output":    "wsRXAm2G9/tMDx2pXaHYOvhDa86Gz7rF3XRs0PefIZk="
								defaults:           "pNoOUFuP2unECDEPfh1KI7RfPkhAeKnEblk59mernqw="
								"defaults output":  "P75in6i1EX1rGWarwuyuSNcul9C0fI+kMsX7UghcbZk="
								name:               "lF8dczzDc9bkKSi32BlBgn9k3Z90N2ceBcoSbCQXBxQ="
								"name output":      "5wCVfeKwzfjNMvb4BwEoKuaCloVUvr2g99S7kPJ680o="
								"extra app":        "TIszq3TdZVwcCtxcemgrMkuNb3+y1iRcTPxzeqWfUMU="
								"extra app output": "1wF0YZ2Q5G4kYysPOlZaWAek8qPnisN+neRu7wIlDbs="
								"pre-trim source":  "OwgbbgEQesjldDyBI+DePejue/oUO6x+Jo+pWhqpK+g="
								"post-trim alpha":  "n4hKBxh/cM0wfgIufWrmpweRFVync3nLvtPCgvoRu9A="
								"post-trim beta":   "0FtqfDLiTsLn4yCqktUnlaE94/VZjbQA6LbMUoUyF8s="
								"post-trim gamma":  "lEuMhruRkleZFefFLj/N8uzEIJFPj0M8bcmAVcUFYNM="
								"post-trim output": "JIi63NNgybRSxg2TtgJC5BbfK2jj6BJhzucNxWM6pE0="
							}
							multi_step: {
								hash:       "LG03ME12O97V1LNCKK7GCS8ITBT9DO5AV1D1JA5PTJ23F16I9F9G===="
								scriptHash: "JIPADP79TIMUIMVVO8STGAUSB5BK8PD9HO8VR1AGQAL09MO36AU0===="
								steps: [{
									doc:      ""
									cmd:      "cue export -o configuration.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 1
									output: """
											app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
											    ./a.cue:3:13
											    ./a.cue:6:12
											    ./schema.cue:6:13

											"""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
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
