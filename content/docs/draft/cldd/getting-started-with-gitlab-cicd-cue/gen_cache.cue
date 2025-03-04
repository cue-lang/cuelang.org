package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-gitlab-cicd-cue": {
						page: {
							cache: {
								upload: {
									"1":  "5OJBWWqxzZVraiblsStYtCQREIHr1w00YFbzN5aA6o8="
									yaml: "Pqm12EN2Jvvnsdugt6eQdwTOVDBOOmMCulvGfoADzrw="
								}
								multi_step: {
									hash:       "3UUMLL3TIO63U56U82NLQ6IVDGR64C0D34NC1AB4IEIINV5TJIOG===="
									scriptHash: "KQPN4EUPSH6FHL53FOKRKP9CGFRVIDTU48DQRB7U2II938E66J90===="
									steps: [{
										doc:      "# Registry auth"
										cmd:      "mkdir -p $HOME/.config/cue"
										exitCode: 0
										output:   ""
									}, {
										doc: ""
										cmd: """
												cat <<EOD >$HOME/.config/cue/logins.json
												{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
												EOD
												"""
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod init cue.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod tidy"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile .gitlab-ci.yml -e pipeline.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv .gitlab-ci.yml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff --side .gitlab-ci.yml{,.got}"
										exitCode: 0
										output: """
												default:\t\t\t\t\t\t\tdefault:
												  image: ruby:3.2\t\t\t\t\t\t  image: ruby:3.2
												workflow:\t\t\t\t\t\t\tworkflow:
												  rules:\t\t\t\t\t\t\t  rules:
												    - if: $CI_COMMIT_BRANCH\t\t\t\t\t    - if: $CI_COMMIT_BRANCH
												deploy-pages:\t\t\t\t\t\t\tdeploy-pages:
												  rules:\t\t\t\t\t\t\t  rules:
												    - if: $CI_COMMIT_BRANCH == "main"\t\t\t\t    - if: $CI_COMMIT_BRANCH == "main"
												  script:\t\t\t\t\t\t\t  script:
												    - gem install bundler\t\t\t\t\t    - gem install bundler
												    - bundle install\t\t\t\t\t\t    - bundle install
												    - bundle exec jekyll build -d public\t\t\t    - bundle exec jekyll build -d public
												  stage: deploy\t\t\t\t\t\t\t  stage: deploy
												  environment: production\t\t\t\t\t  environment: production
												  pages: true\t\t\t\t\t\t\t  pages: true
												test:\t\t\t\t\t\t\t\ttest:
												  rules:\t\t\t\t\t\t\t  rules:
												    - if: $CI_COMMIT_BRANCH != "main"\t\t\t\t    - if: $CI_COMMIT_BRANCH != "main"
												  script:\t\t\t\t\t\t\t  script:
												    - gem install bundler\t\t\t\t\t    - gem install bundler
												    - bundle install\t\t\t\t\t\t    - bundle install
												    - bundle exec jekyll build -d test\t\t\t\t    - bundle exec jekyll build -d test
												  stage: test\t\t\t\t\t\t\t  stage: test
												  artifacts:\t\t\t\t\t\t\t  artifacts:
												    paths:\t\t\t\t\t\t\t    paths:
												      - test\t\t\t\t\t\t\t      - test

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
}
