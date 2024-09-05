package site
{
	content: {
		docs: {
			howto: {
				"build-cue-api-java-jar": {
					page: {
						cache: {
							upload: {
								"HIDDEN: configure Maven download cache": "cf+K6avUf1oPvSAeGtMeR+5pFRZRE+OTyrmduQbJ1KQ="
								"test load":                              "gn7o/uit9WN3U1Szj2aZwe+O9f1OQ0R3dpK92huu8Hs="
							}
							multi_step: {
								hash:       "IRVFAI5128I6QKN9F7V1B9F9890JSI73C607D9VGN2Q3DMINI2T0===="
								scriptHash: "D3P3UH58SHI11V1TRCCG8IUA6R9GR7J8MAFOVUOVTVDEO8T6MKEG===="
								steps: [{
									doc:      ""
									cmd:      "javac --version"
									exitCode: 0
									output: """
											javac 22.0.2

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "mvn --version"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "git --version"
									exitCode: 0
									output: """
											git version 2.39.2

											"""
								}, {
									doc:      ""
									cmd:      "export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "git clone https://github.com/cue-lang/cue-api-java cue-api-java-source"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cd cue-api-java-source"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "git checkout 3c12bb9e9ea203d4de8308b4145e876e4b60207e"
									exitCode: 0
									output: """
											Note: switching to '3c12bb9e9ea203d4de8308b4145e876e4b60207e'.
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "mvn package"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "mv target/CUE*.jar CUE.jar"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "javac -cp CUE.jar TestLoad.java"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "java --enable-native-access=ALL-UNNAMED -cp CUE.jar:. TestLoad"
									exitCode: 0
									output: """
											CUE loaded successfully!

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
