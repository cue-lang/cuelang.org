package site
{
	content: {
		docs: {
			draft: {
				"cbe-005_gitlab_ci": {
					page: {
						cache: {
							upload: {
								"4":  "D9gApmlVtvykVnQvKyzsowN9QEwctBCGJ1sub5a4DY4="
								"5":  "dGNZ65PecdAXnuJ0F4txQE/fCifrQsU6nD3+LqaflsM="
								"10": "XCdlUIvLbbPJoZj13DO+SGgIScsOiEJK3FOGBFDkJLk="
								"11": "No6S2XI4xhIb+mys8bUF6sp4A7IP4CtbmB1gw7Al+AE="
								"12": "emd8O+7RDFVhrq6U2J8ATn6CLRcONvDrY0T2GedV8pI="
								"14": "zjqr+NIJxV8fQVUT7OUlnn3PyNgovjTqDyRDuI5gIOY="
							}
							multi_step: {
								hash:       "G6HJ0H86CSQN2E51KHULSSCJ0B74QG4AC53NN0TDL6L6UVN3R48G===="
								scriptHash: "Q10R47MT73DCBI4JPKHUFD2FB9UII0IU025K0D2UHPK5JQJGKS60===="
								steps: [{
									doc: """
											# Required because v0.10.0 suffers from https://cuelang.org/issue/3462, which
											# is fixed in v0.11.0-alpha.2 and later.
											"""
									cmd:      "export PATH=/cues/v0.11.0-alpha.2:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "# Set up example content as a git repo."
									cmd:      "cd Flockademic"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "git init ."
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "git config user.email cuelang.org@cue.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git config user.name cuelang.org"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git add . -v"
									exitCode: 0
									output: """
											add '.gitlab-ci.yml'

											"""
								}, {
									doc:      ""
									cmd:      "git commit -m \"Initial commit\" >/dev/null"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd .."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd Flockademic # our example repository"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git status # should report \"working tree clean\""
									exitCode: 0
									output: """
											On branch master
											nothing to commit, working tree clean

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init gitlab.com/flockademic/flockademic"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import .gitlab-ci.yml --with-context -p gitlab -f -l pipelines: -l 'strings.TrimSuffix(path.Base(filename),path.Ext(filename))' -o gitlab-ci.cue"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# ls {,.}*gitlab-ci*
											"""
									cmd:      "ls {,.}*gitlab-ci* >../4.expected.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../4.expected.txt ../4.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# head -9 gitlab-ci.cue
											"""
									cmd:      "head -9 gitlab-ci.cue >../5.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff --side ../5.expected.txt ../5.actual.txt"
									exitCode: 0
									output: """
											package gitlab\t\t\t\t\t\t\tpackage gitlab

											pipelines: ".gitlab-ci": {\t\t\t\t\tpipelines: ".gitlab-ci": {
											\timage: "node:8.10"\t\t\t\t\t\timage: "node:8.10"
											\tstages: [\t\t\t\t\t\t\tstages: [
											\t\t"prepare",\t\t\t\t\t\t\t"prepare",
											\t\t"test",\t\t\t\t\t\t\t\t"test",
											\t\t"build-backend",\t\t\t\t\t\t"build-backend",
											\t\t"deploy-backend",\t\t\t\t\t\t"deploy-backend",

											"""
								}, {
									doc:      ""
									cmd:      "mkdir -p internal/ci/gitlab"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv gitlab-ci.cue internal/ci/gitlab"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "curl -sSo internal/ci/gitlab/gitlab.cicd.pipeline.schema.json https://gitlab.com/gitlab-org/gitlab/-/raw/7aa6170c4c81a98f372d7c52f3918858c4b69cca/app/assets/javascripts/editor/schema/ci.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import jsonschema+strictFeatures=0: internal/ci/gitlab/gitlab.cicd.pipeline.schema.json -p gitlab -l '#Pipeline:'"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd $(git rev-parse --show-toplevel) # make sure we're sitting at the repository root"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue help cmd regenerate ./internal/ci/gitlab   # the "./" prefix is required
											"""
									cmd:      "cue help cmd regenerate ./internal/ci/gitlab | head -4 >../12.expected.txt"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Sometimes the above command's regeneration of the YAML file doesn't get
											# sync'd to disk before we git-diff it, below. Make sure that it does.
											"""
									cmd:      "sync"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../12.expected.txt ../12.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue cmd regenerate ./internal/ci/gitlab # the \"./\" prefix is required"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# git diff .gitlab-ci.yml
											# For some unknown reason the trailing '>../...' redirection *only* works when
											# the diff command is given a '--' separator. I'm utterly stumped, but let's
											# just give it what it wants!
											"""
									cmd:      "git diff -- .gitlab-ci.yml | grep -v '^index [0-9a-f]{7}\\.\\.[0-9a-f]{7}' | head -10 >../14.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git diff -- .gitlab-ci.yml >../14.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git diff .gitlab-ci.yml | cat"
									exitCode: 0
									output: """
											diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
											index d0eaf80..d0a309e 100644
											--- a/.gitlab-ci.yml
											+++ b/.gitlab-ci.yml
											@@ -1,5 +1,6 @@
											-image: node:8.10
											+# Code generated by internal/ci/gitlab/ci_tool.cue; DO NOT EDIT.
											 
											+image: node:8.10
											 stages:
											   - prepare
											   - test
											@@ -9,7 +10,6 @@ stages:
											   - build-frontend
											   - deploy-frontend
											   - confidence-check
											-
											 prepare:
											   stage: prepare
											   script:
											@@ -18,7 +18,7 @@ prepare:
											   artifacts:
											     expire_in: 1 month
											     paths:
											-    - node_modules/
											+      - node_modules/
											 prepare_frontend:
											   stage: prepare
											   script:
											@@ -28,7 +28,7 @@ prepare_frontend:
											   artifacts:
											     expire_in: 1 month
											     paths:
											-    - stacks/frontend/node_modules/
											+      - stacks/frontend/node_modules/
											 prepare_server:
											   stage: prepare
											   script:
											@@ -38,7 +38,7 @@ prepare_server:
											   artifacts:
											     expire_in: 1 month
											     paths:
											-    - server/node_modules/
											+      - server/node_modules/
											 prepare_accounts:
											   stage: prepare
											   script:
											@@ -48,7 +48,7 @@ prepare_accounts:
											   artifacts:
											     expire_in: 1 month
											     paths:
											-    - stacks/accounts/node_modules/
											+      - stacks/accounts/node_modules/
											 prepare_periodicals:
											   stage: prepare
											   script:
											@@ -58,26 +58,25 @@ prepare_periodicals:
											   artifacts:
											     expire_in: 1 month
											     paths:
											-    - stacks/periodicals/node_modules/
											-
											+      - stacks/periodicals/node_modules/
											 test:
											   stage: test
											   dependencies:
											-   - prepare
											+    - prepare
											   script:
											-   - yarn run test
											+    - yarn run test
											 test_frontend:
											   stage: test
											   dependencies:
											-   - prepare
											-   - prepare_frontend
											+    - prepare
											+    - prepare_frontend
											   script:
											     - cd stacks/frontend
											     - yarn run test --ci
											   artifacts:
											     expire_in: 1 week
											     paths:
											-    - stacks/frontend/__tests__/__coverage__/
											+      - stacks/frontend/__tests__/__coverage__/
											     when: always
											 test_accounts:
											   stage: test
											@@ -90,7 +89,7 @@ test_accounts:
											   artifacts:
											     expire_in: 1 week
											     paths:
											-    - stacks/accounts/__tests__/__coverage__/
											+      - stacks/accounts/__tests__/__coverage__/
											     when: always
											 test_periodicals:
											   stage: test
											@@ -103,73 +102,67 @@ test_periodicals:
											   artifacts:
											     expire_in: 1 week
											     paths:
											-    - stacks/periodicals/__tests__/__coverage__/
											+      - stacks/periodicals/__tests__/__coverage__/
											     when: always
											-
											 build_terraform:
											   stage: build-backend
											-  dependencies:
											-    # No previous assets needed for this job
											+  dependencies: null
											   script: echo "Dummy job to preserve artifacts for the undeploy job"
											   artifacts:
											     expire_in: 1 month
											     paths:
											-    # The below files are needed for the undeploy jobs,
											-    # because when undeploying the branch (and thus these files) is no longer available
											-    - stacks.tf
											-    - stacks/*.tf
											-    - stacks/*/*.tf
											-    - stacks/*/*_lambda_role_policy.json
											-    - stacks/*/*_lambda_policy.json
											+      - stacks.tf
											+      - stacks/*.tf
											+      - stacks/*/*.tf
											+      - stacks/*/*_lambda_role_policy.json
											+      - stacks/*/*_lambda_policy.json
											 build_server:
											   stage: build-backend
											   dependencies:
											-     - prepare_server
											+    - prepare_server
											   script:
											     - cd server
											     - yarn run build
											   artifacts:
											     expire_in: 1 month
											     paths:
											-    - server/dist/
											+      - server/dist/
											 build_accounts:
											   stage: build-backend
											   dependencies:
											-   - prepare
											-   - prepare_accounts
											+    - prepare
											+    - prepare_accounts
											   script:
											     - cd stacks/accounts
											     - yarn run build
											   artifacts:
											     expire_in: 1 month
											     paths:
											-    - stacks/accounts/dist/
											+      - stacks/accounts/dist/
											 build_periodicals:
											   stage: build-backend
											   dependencies:
											-   - prepare
											-   - prepare_periodicals
											+    - prepare
											+    - prepare_periodicals
											   script:
											     - cd stacks/periodicals
											     - yarn run build
											   artifacts:
											     expire_in: 1 month
											     paths:
											-    - stacks/periodicals/dist/
											-
											+      - stacks/periodicals/dist/
											 deploy_terraform:
											   stage: deploy-backend
											   image:
											     name: hashicorp/terraform:0.11.2
											     entrypoint:
											-      # These values provided by https://github.com/hashicorp/docker-hub-images/issues/37#issuecomment-356330221
											-      - '/usr/bin/env'
											-      - 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
											+      - /usr/bin/env
											+      - PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
											   dependencies:
											-   - build_terraform
											-   - build_server
											-   - build_accounts
											-   - build_periodicals
											+    - build_terraform
											+    - build_server
											+    - build_accounts
											+    - build_periodicals
											   script:
											     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export TF_VAR_aws_access_key_id=$AWS_ACCESS_KEY_ID_PRODUCTION; else export TF_VAR_aws_access_key_id=$AWS_ACCESS_KEY_ID; fi;
											     - export TF_VAR_aws_account_id=$AWS_ACCOUNT_ID
											@@ -180,13 +173,7 @@ deploy_terraform:
											     - export TF_VAR_jwt_secret=$(echo "$JWT_SECRET$CI_COMMIT_REF_NAME" | sha512sum)
											     - export TF_VAR_frontend_url="https://$CI_COMMIT_REF_SLUG.flockademic.com"
											     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export TF_VAR_orcid_base_path="$ORCID_BASE_PATH_PRODUCTION"; export TF_VAR_orcid_client_id="$ORCID_CLIENT_ID_PRODUCTION"; export TF_VAR_orcid_client_secret="$ORCID_CLIENT_SECRET_PRODUCTION"; else export TF_VAR_orcid_base_path="$ORCID_BASE_PATH"; export TF_VAR_orcid_client_id="$ORCID_CLIENT_ID"; export TF_VAR_orcid_client_secret="$ORCID_CLIENT_SECRET"; fi;
											-    # Use the branch/tag name as the TerraForm Workspace,
											-    # limited to 26 chars (30 is the max length of Heroku app names, which we prepend with `fl9-`),
											-    # and with a potential trailing dash stripped
											-    # (Note that I'd rather name this $TF_WORKSPACE, but:
											-    # https://github.com/hashicorp/terraform/issues/15874 )
											     - export WORKSPACE_NAME=`echo $CI_COMMIT_REF_SLUG | cut -c 1-26 | sed -e 's/-$//'`
											-    # Deploy everything
											     - terraform version
											     - terraform init -backend-config="region=$TF_VAR_aws_region" -input=false
											     - terraform workspace select $WORKSPACE_NAME || terraform workspace new $WORKSPACE_NAME
											@@ -194,15 +181,12 @@ deploy_terraform:
											     - terraform graph
											     - terraform plan -out .tfplan -input=false | sed -e "s/$TF_VAR_aws_access_key_id/***/g" | sed -e "s/$TF_VAR_aws_secret_access_key/***/g"
											     - terraform apply -input=false .tfplan | sed -e "s/$TF_VAR_aws_access_key_id/***/g" | sed -e "s/$TF_VAR_aws_secret_access_key/***/g" | sed -e "s/$TF_VAR_orcid_client_secret/***/g"
											-    # Store the API endpoint to a file so that we can pass it on to other jobs (without a trailing slash)
											     - terraform output heroku_web_url | sed s'/\\/$//' > api_url
											     - terraform output heroku_git_url > heroku_git_url
											-    # Copy everything to a dir to push to Heroku
											     - cd server
											     - mkdir -p dist/stacks/accounts
											     - mkdir -p dist/stacks/periodicals
											     - cp package.json yarn.lock dist
											-    # Make sure that library dependencies are available to all stacks:
											     - cp ../package.json ../yarn.lock dist/stacks
											     - cp -r ../stacks/accounts/dist ../stacks/accounts/package.json ../stacks/accounts/yarn.lock dist/stacks/accounts
											     - cp -r ../stacks/periodicals/dist ../stacks/periodicals/package.json ../stacks/periodicals/yarn.lock dist/stacks/periodicals
											@@ -221,22 +205,20 @@ deploy_terraform:
											     url: https://api.$CI_COMMIT_REF_SLUG.flockademic.com
											     on_stop: stop_terraform
											   artifacts:
											-    # This is just needed for subsequent jobs, so 1 hour should be enough
											     expire_in: 1 hour
											     paths:
											-     - api_url
											+      - api_url
											 stop_terraform:
											   stage: deploy-backend
											   image:
											     name: hashicorp/terraform:0.11.2
											     entrypoint:
											-      # These values provided by https://github.com/hashicorp/docker-hub-images/issues/37#issuecomment-356330221
											-      - '/usr/bin/env'
											-      - 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
											+      - /usr/bin/env
											+      - PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
											   variables:
											     GIT_STRATEGY: none
											   dependencies:
											-   - build_terraform
											+    - build_terraform
											   script:
											     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export TF_VAR_aws_access_key_id=$AWS_ACCESS_KEY_ID_PRODUCTION; else export TF_VAR_aws_access_key_id=$AWS_ACCESS_KEY_ID; fi;
											     - export TF_VAR_aws_account_id=$AWS_ACCOUNT_ID
											@@ -249,11 +231,6 @@ stop_terraform:
											     - export TF_VAR_orcid_client_id="irrelevant_for_undeployment"
											     - export TF_VAR_orcid_client_secret="irrelevant_for_undeployment"
											     - export TF_VAR_frontend_url="irrelevant_for_undeployment"
											-    # Use the branch/tag name as the TerraForm Workspace,
											-    # limited to 26 chars (30 is the max length of Heroku app names, which we prepend with `fl9-`),
											-    # and with a potential trailing dash stripped
											-    # (Note that I'd rather name this $TF_WORKSPACE, but:
											-    # https://github.com/hashicorp/terraform/issues/15874 )
											     - export WORKSPACE_NAME=`echo $CI_COMMIT_REF_SLUG | cut -c 1-26 | sed -e 's/-$//'`
											     - terraform init -backend-config="region=$TF_VAR_aws_region" -input=false
											     - terraform workspace select $WORKSPACE_NAME
											@@ -264,22 +241,15 @@ stop_terraform:
											   environment:
											     name: review_api/$CI_COMMIT_REF_SLUG
											     action: stop
											-
											 provision_databases:
											   stage: provision-backend
											   dependencies:
											-   - deploy_terraform
											+    - deploy_terraform
											   image: alpine:3.6
											   script:
											     - apk add --no-cache curl jq postgresql-client
											-    # Use the branch/tag name as the TerraForm Workspace,
											-    # limited to 26 chars (30 is the max length of Heroku app names, which we prepend with `fl9-`),
											-    # and with a potential trailing dash stripped
											-    # (Note that I'd rather name this $TF_WORKSPACE, but:
											-    # https://github.com/hashicorp/terraform/issues/15874 )
											     - export WORKSPACE_NAME=`echo $CI_COMMIT_REF_SLUG | cut -c 1-26 | sed -e 's/-$//'`
											-    - "DATABASE_URL=`curl -X GET \\"https://api.heroku.com/apps/fl9-${WORKSPACE_NAME}/config-vars\\" -H \\"Accept: application/vnd.heroku+json; version=3\\" -H \\"Authorization: Bearer ${HEROKU_API_KEY}\\" | jq -r \\".DATABASE_URL\\"`"
											-    # $DATABASE_URL is of the form `postgres://<username>:<password>@<hostname>:<port>/<database>
											+    - 'DATABASE_URL=`curl -X GET "https://api.heroku.com/apps/fl9-${WORKSPACE_NAME}/config-vars" -H "Accept: application/vnd.heroku+json; version=3" -H "Authorization: Bearer ${HEROKU_API_KEY}" | jq -r ".DATABASE_URL"`'
											     - export PGHOST=`echo ${DATABASE_URL:11} | cut -d '@' -f 2 | cut -d ':' -f 1`
											     - export PGPORT=`echo ${DATABASE_URL:11} | cut -d '@' -f 2 | cut -d ':' -f 2 | cut -d '/' -f 1`
											     - export PGUSER=`echo ${DATABASE_URL:11} | cut -d '@' -f 1 | cut -d ':' -f 1`
											@@ -287,15 +257,13 @@ provision_databases:
											     - echo "$PGHOST:$PGPORT:$PGDATABASE:$PGUSER:`echo ${DATABASE_URL:11} | cut -d '@' -f 1 | cut -d ':' -f 2`" > .pgpass.conf
											     - chmod 0600 .pgpass.conf
											     - export PGPASSFILE=.pgpass.conf
											-    # Create the databases and provision them:
											     - sh stacks/provision_databases.sh stacks
											-
											 build_frontend:
											   stage: build-frontend
											   dependencies:
											-   - prepare
											-   - prepare_frontend
											-   - deploy_terraform
											+    - prepare
											+    - prepare_frontend
											+    - deploy_terraform
											   script:
											     - cd stacks/frontend
											     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export ORCID_BASE_PATH="$ORCID_BASE_PATH_PRODUCTION"; export ORCID_CLIENT_ID="$ORCID_CLIENT_ID_PRODUCTION"; fi;
											@@ -306,17 +274,14 @@ build_frontend:
											   artifacts:
											     expire_in: 1 month
											     paths:
											-    - stacks/frontend/dist/
											-    # The below files are needed for the undeploy jobs,
											-    # because when undeploying the branch (and thus these files) is no longer available
											-    - stacks/frontend/package.json
											-    - stacks/frontend/build/
											-
											+      - stacks/frontend/dist/
											+      - stacks/frontend/package.json
											+      - stacks/frontend/build/
											 deploy_frontend:
											   stage: deploy-frontend
											   dependencies:
											-   - prepare_frontend
											-   - build_frontend
											+    - prepare_frontend
											+    - build_frontend
											   script:
											     - cd stacks/frontend
											     - yarn run deploy
											@@ -330,8 +295,8 @@ deploy_frontend:
											 deploy_frontend_prod:
											   stage: deploy-frontend
											   dependencies:
											-   - prepare_frontend
											-   - build_frontend
											+    - prepare_frontend
											+    - build_frontend
											   script:
											     - cd stacks/frontend
											     - export AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID_PRODUCTION"
											@@ -339,8 +304,6 @@ deploy_frontend_prod:
											     - yarn run deploy
											     - yarn run awaitDeployTasks
											   environment:
											-    # Since the deploy_terraform environment cannot have different environment names for production and review apps,
											-    # we're not doing that here either in order to be able to match on the name and make certain variables only available to production.
											     name: review/$CI_COMMIT_REF_SLUG
											     url: https://flockademic.com
											   only:
											@@ -350,8 +313,8 @@ stop_frontend:
											   variables:
											     GIT_STRATEGY: none
											   dependencies:
											-   - prepare_frontend
											-   - build_frontend
											+    - prepare_frontend
											+    - build_frontend
											   script:
											     - cd stacks/frontend
											     - yarn run undeploy
											@@ -359,74 +322,67 @@ stop_frontend:
											   environment:
											     name: review/$CI_COMMIT_REF_SLUG
											     action: stop
											-
											 e2e:firefox:
											   stage: confidence-check
											   services:
											     - selenium/standalone-firefox:3.13
											   dependencies:
											-   - prepare
											+    - prepare
											   script:
											     - if [[ $CI_COMMIT_REF_NAME == $BRANCH_IN_MAINTENANCE ]]; then echo 'Running checks in maintenance mode.'; export MAINTENANCE_MODE=true; fi;
											     - yarn run confidence-check --host=selenium__standalone-firefox
											   artifacts:
											     expire_in: 1 week
											     paths:
											-    - __e2e__/results/
											-    - __e2e__/errorShots/
											+      - __e2e__/results/
											+      - __e2e__/errorShots/
											     when: always
											-  # GUI tests loading a full browser are notoriously unstable.
											-  # See https://gitlab.com/Flockademic/Flockademic/issues/366
											   retry: 2
											 e2e:chrome:
											   stage: confidence-check
											   services:
											     - selenium/standalone-chrome:3.13
											   dependencies:
											-   - prepare
											+    - prepare
											   script:
											     - if [[ $CI_COMMIT_REF_NAME == $BRANCH_IN_MAINTENANCE ]]; then echo 'Running checks in maintenance mode.'; export MAINTENANCE_MODE=true; fi;
											     - yarn run confidence-check --host=selenium__standalone-chrome
											   artifacts:
											     expire_in: 1 week
											     paths:
											-    - __e2e__/results/
											-    - __e2e__/errorShots/
											+      - __e2e__/results/
											+      - __e2e__/errorShots/
											     when: always
											-  # GUI tests loading a full browser are notoriously unstable.
											-  # See https://gitlab.com/Flockademic/Flockademic/issues/366
											   retry: 2
											-# See https://docs.gitlab.com/ce/ci/examples/sast.html
											 sast:
											   stage: confidence-check
											   image: registry.gitlab.com/gitlab-org/gl-sast:latest
											   dependencies:
											-   - prepare
											-   - prepare_frontend
											-   - prepare_accounts
											-   - prepare_periodicals
											+    - prepare
											+    - prepare_frontend
											+    - prepare_accounts
											+    - prepare_periodicals
											   script:
											     - /app/bin/run .
											   artifacts:
											     paths:
											-    - gl-sast-report.json
											-# See https://docs.gitlab.com/ee/ci/examples/dast.html
											+      - gl-sast-report.json
											 dast:
											   stage: confidence-check
											   image: owasp/zap2docker-weekly
											-  dependencies:
											+  dependencies: null
											   script:
											     - mkdir /zap/wrk/
											     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export SITE_URL=https://flockademic.com; else export SITE_URL=https://$CI_COMMIT_REF_SLUG.flockademic.com; fi;
											     - /zap/zap-baseline.py -J gl-dast-report.json -t $SITE_URL || true
											     - cp /zap/wrk/gl-dast-report.json .
											   artifacts:
											-    paths: [gl-dast-report.json]
											-# See https://docs.gitlab.com/ee/ci/examples/browser_performance.html
											+    paths:
											+      - gl-dast-report.json
											 performance:
											   stage: confidence-check
											   image: docker:git
											-  dependencies:
											+  dependencies: null
											   services:
											     - docker:stable-dind
											   script:
											@@ -438,7 +394,7 @@ performance:
											     - mv sitespeed-results/data/performance.json performance.json
											   artifacts:
											     paths:
											-    - performance.json
											+      - performance.json
											 license_management:
											   stage: confidence-check
											   image: docker:stable
											@@ -449,8 +405,7 @@ license_management:
											     - docker:stable-dind
											   script:
											     - export LICENSE_MANAGEMENT_VERSION=$(echo "$CI_SERVER_VERSION" | sed 's/^\\([0-9]*\\)\\.\\([0-9]*\\).*/\\1-\\2-stable/')
											-    - docker run
											-        --volume "$PWD:/code"
											-        "registry.gitlab.com/gitlab-org/security-products/license-management:$LICENSE_MANAGEMENT_VERSION" analyze /code
											+    - docker run --volume "$PWD:/code" "registry.gitlab.com/gitlab-org/security-products/license-management:$LICENSE_MANAGEMENT_VERSION" analyze /code
											   artifacts:
											-    paths: [gl-license-management-report.json]
											+    paths:
											+      - gl-license-management-report.json

											"""
								}, {
									doc:      ""
									cmd:      "echo hello"
									exitCode: 0
									output: """
											hello

											"""
								}, {
									doc:      ""
									cmd:      "diff --side ../14.expected.txt ../14.actual.txt"
									exitCode: 1
									output: """
											diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml\t\t\tdiff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
											\t\t\t\t\t\t\t      >\tindex d0eaf80..d0a309e 100644
											--- a/.gitlab-ci.yml\t\t\t\t\t\t--- a/.gitlab-ci.yml
											+++ b/.gitlab-ci.yml\t\t\t\t\t\t+++ b/.gitlab-ci.yml
											@@ -1,5 +1,6 @@\t\t\t\t\t\t\t@@ -1,5 +1,6 @@
											-image: node:8.10\t\t\t\t\t\t-image: node:8.10
											+# Code generated by internal/ci/gitlab/ci_tool.cue; DO NOT E\t+# Code generated by internal/ci/gitlab/ci_tool.cue; DO NOT E
											\t\t\t\t\t\t\t      |\t 
											+image: node:8.10\t\t\t\t\t\t+image: node:8.10
											 stages:\t\t\t\t\t\t\t stages:
											   - prepare\t\t\t\t\t\t\t   - prepare
											   - test\t\t\t\t\t\t\t   - test
											\t\t\t\t\t\t\t      >\t@@ -9,7 +10,6 @@ stages:
											\t\t\t\t\t\t\t      >\t   - build-frontend
											\t\t\t\t\t\t\t      >\t   - deploy-frontend
											\t\t\t\t\t\t\t      >\t   - confidence-check
											\t\t\t\t\t\t\t      >\t-
											\t\t\t\t\t\t\t      >\t prepare:
											\t\t\t\t\t\t\t      >\t   stage: prepare
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t@@ -18,7 +18,7 @@ prepare:
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 month
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - node_modules/
											\t\t\t\t\t\t\t      >\t+      - node_modules/
											\t\t\t\t\t\t\t      >\t prepare_frontend:
											\t\t\t\t\t\t\t      >\t   stage: prepare
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t@@ -28,7 +28,7 @@ prepare_frontend:
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 month
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - stacks/frontend/node_modules/
											\t\t\t\t\t\t\t      >\t+      - stacks/frontend/node_modules/
											\t\t\t\t\t\t\t      >\t prepare_server:
											\t\t\t\t\t\t\t      >\t   stage: prepare
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t@@ -38,7 +38,7 @@ prepare_server:
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 month
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - server/node_modules/
											\t\t\t\t\t\t\t      >\t+      - server/node_modules/
											\t\t\t\t\t\t\t      >\t prepare_accounts:
											\t\t\t\t\t\t\t      >\t   stage: prepare
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t@@ -48,7 +48,7 @@ prepare_accounts:
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 month
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - stacks/accounts/node_modules/
											\t\t\t\t\t\t\t      >\t+      - stacks/accounts/node_modules/
											\t\t\t\t\t\t\t      >\t prepare_periodicals:
											\t\t\t\t\t\t\t      >\t   stage: prepare
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t@@ -58,26 +58,25 @@ prepare_periodicals:
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 month
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - stacks/periodicals/node_modules/
											\t\t\t\t\t\t\t      >\t-
											\t\t\t\t\t\t\t      >\t+      - stacks/periodicals/node_modules/
											\t\t\t\t\t\t\t      >\t test:
											\t\t\t\t\t\t\t      >\t   stage: test
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - prepare
											\t\t\t\t\t\t\t      >\t+    - prepare
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t-   - yarn run test
											\t\t\t\t\t\t\t      >\t+    - yarn run test
											\t\t\t\t\t\t\t      >\t test_frontend:
											\t\t\t\t\t\t\t      >\t   stage: test
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - prepare
											\t\t\t\t\t\t\t      >\t-   - prepare_frontend
											\t\t\t\t\t\t\t      >\t+    - prepare
											\t\t\t\t\t\t\t      >\t+    - prepare_frontend
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - cd stacks/frontend
											\t\t\t\t\t\t\t      >\t     - yarn run test --ci
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 week
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - stacks/frontend/__tests__/__coverage__/
											\t\t\t\t\t\t\t      >\t+      - stacks/frontend/__tests__/__coverage__/
											\t\t\t\t\t\t\t      >\t     when: always
											\t\t\t\t\t\t\t      >\t test_accounts:
											\t\t\t\t\t\t\t      >\t   stage: test
											\t\t\t\t\t\t\t      >\t@@ -90,7 +89,7 @@ test_accounts:
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 week
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - stacks/accounts/__tests__/__coverage__/
											\t\t\t\t\t\t\t      >\t+      - stacks/accounts/__tests__/__coverage__/
											\t\t\t\t\t\t\t      >\t     when: always
											\t\t\t\t\t\t\t      >\t test_periodicals:
											\t\t\t\t\t\t\t      >\t   stage: test
											\t\t\t\t\t\t\t      >\t@@ -103,73 +102,67 @@ test_periodicals:
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 week
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - stacks/periodicals/__tests__/__coverage__/
											\t\t\t\t\t\t\t      >\t+      - stacks/periodicals/__tests__/__coverage__/
											\t\t\t\t\t\t\t      >\t     when: always
											\t\t\t\t\t\t\t      >\t-
											\t\t\t\t\t\t\t      >\t build_terraform:
											\t\t\t\t\t\t\t      >\t   stage: build-backend
											\t\t\t\t\t\t\t      >\t-  dependencies:
											\t\t\t\t\t\t\t      >\t-    # No previous assets needed for this job
											\t\t\t\t\t\t\t      >\t+  dependencies: null
											\t\t\t\t\t\t\t      >\t   script: echo "Dummy job to preserve artifacts for the unde
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 month
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    # The below files are needed for the undeploy jobs,
											\t\t\t\t\t\t\t      >\t-    # because when undeploying the branch (and thus these fi
											\t\t\t\t\t\t\t      >\t-    - stacks.tf
											\t\t\t\t\t\t\t      >\t-    - stacks/*.tf
											\t\t\t\t\t\t\t      >\t-    - stacks/*/*.tf
											\t\t\t\t\t\t\t      >\t-    - stacks/*/*_lambda_role_policy.json
											\t\t\t\t\t\t\t      >\t-    - stacks/*/*_lambda_policy.json
											\t\t\t\t\t\t\t      >\t+      - stacks.tf
											\t\t\t\t\t\t\t      >\t+      - stacks/*.tf
											\t\t\t\t\t\t\t      >\t+      - stacks/*/*.tf
											\t\t\t\t\t\t\t      >\t+      - stacks/*/*_lambda_role_policy.json
											\t\t\t\t\t\t\t      >\t+      - stacks/*/*_lambda_policy.json
											\t\t\t\t\t\t\t      >\t build_server:
											\t\t\t\t\t\t\t      >\t   stage: build-backend
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-     - prepare_server
											\t\t\t\t\t\t\t      >\t+    - prepare_server
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - cd server
											\t\t\t\t\t\t\t      >\t     - yarn run build
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 month
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - server/dist/
											\t\t\t\t\t\t\t      >\t+      - server/dist/
											\t\t\t\t\t\t\t      >\t build_accounts:
											\t\t\t\t\t\t\t      >\t   stage: build-backend
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - prepare
											\t\t\t\t\t\t\t      >\t-   - prepare_accounts
											\t\t\t\t\t\t\t      >\t+    - prepare
											\t\t\t\t\t\t\t      >\t+    - prepare_accounts
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - cd stacks/accounts
											\t\t\t\t\t\t\t      >\t     - yarn run build
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 month
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - stacks/accounts/dist/
											\t\t\t\t\t\t\t      >\t+      - stacks/accounts/dist/
											\t\t\t\t\t\t\t      >\t build_periodicals:
											\t\t\t\t\t\t\t      >\t   stage: build-backend
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - prepare
											\t\t\t\t\t\t\t      >\t-   - prepare_periodicals
											\t\t\t\t\t\t\t      >\t+    - prepare
											\t\t\t\t\t\t\t      >\t+    - prepare_periodicals
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - cd stacks/periodicals
											\t\t\t\t\t\t\t      >\t     - yarn run build
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 month
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - stacks/periodicals/dist/
											\t\t\t\t\t\t\t      >\t-
											\t\t\t\t\t\t\t      >\t+      - stacks/periodicals/dist/
											\t\t\t\t\t\t\t      >\t deploy_terraform:
											\t\t\t\t\t\t\t      >\t   stage: deploy-backend
											\t\t\t\t\t\t\t      >\t   image:
											\t\t\t\t\t\t\t      >\t     name: hashicorp/terraform:0.11.2
											\t\t\t\t\t\t\t      >\t     entrypoint:
											\t\t\t\t\t\t\t      >\t-      # These values provided by https://github.com/hashicor
											\t\t\t\t\t\t\t      >\t-      - '/usr/bin/env'
											\t\t\t\t\t\t\t      >\t-      - 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/
											\t\t\t\t\t\t\t      >\t+      - /usr/bin/env
											\t\t\t\t\t\t\t      >\t+      - PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/b
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - build_terraform
											\t\t\t\t\t\t\t      >\t-   - build_server
											\t\t\t\t\t\t\t      >\t-   - build_accounts
											\t\t\t\t\t\t\t      >\t-   - build_periodicals
											\t\t\t\t\t\t\t      >\t+    - build_terraform
											\t\t\t\t\t\t\t      >\t+    - build_server
											\t\t\t\t\t\t\t      >\t+    - build_accounts
											\t\t\t\t\t\t\t      >\t+    - build_periodicals
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export 
											\t\t\t\t\t\t\t      >\t     - export TF_VAR_aws_account_id=$AWS_ACCOUNT_ID
											\t\t\t\t\t\t\t      >\t@@ -180,13 +173,7 @@ deploy_terraform:
											\t\t\t\t\t\t\t      >\t     - export TF_VAR_jwt_secret=$(echo "$JWT_SECRET$CI_COMMIT
											\t\t\t\t\t\t\t      >\t     - export TF_VAR_frontend_url="https://$CI_COMMIT_REF_SLU
											\t\t\t\t\t\t\t      >\t     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export 
											\t\t\t\t\t\t\t      >\t-    # Use the branch/tag name as the TerraForm Workspace,
											\t\t\t\t\t\t\t      >\t-    # limited to 26 chars (30 is the max length of Heroku ap
											\t\t\t\t\t\t\t      >\t-    # and with a potential trailing dash stripped
											\t\t\t\t\t\t\t      >\t-    # (Note that I'd rather name this $TF_WORKSPACE, but:
											\t\t\t\t\t\t\t      >\t-    # https://github.com/hashicorp/terraform/issues/15874 )
											\t\t\t\t\t\t\t      >\t     - export WORKSPACE_NAME=`echo $CI_COMMIT_REF_SLUG | cut 
											\t\t\t\t\t\t\t      >\t-    # Deploy everything
											\t\t\t\t\t\t\t      >\t     - terraform version
											\t\t\t\t\t\t\t      >\t     - terraform init -backend-config="region=$TF_VAR_aws_reg
											\t\t\t\t\t\t\t      >\t     - terraform workspace select $WORKSPACE_NAME || terrafor
											\t\t\t\t\t\t\t      >\t@@ -194,15 +181,12 @@ deploy_terraform:
											\t\t\t\t\t\t\t      >\t     - terraform graph
											\t\t\t\t\t\t\t      >\t     - terraform plan -out .tfplan -input=false | sed -e "s/$
											\t\t\t\t\t\t\t      >\t     - terraform apply -input=false .tfplan | sed -e "s/$TF_V
											\t\t\t\t\t\t\t      >\t-    # Store the API endpoint to a file so that we can pass i
											\t\t\t\t\t\t\t      >\t     - terraform output heroku_web_url | sed s'/\\/$//' > api_
											\t\t\t\t\t\t\t      >\t     - terraform output heroku_git_url > heroku_git_url
											\t\t\t\t\t\t\t      >\t-    # Copy everything to a dir to push to Heroku
											\t\t\t\t\t\t\t      >\t     - cd server
											\t\t\t\t\t\t\t      >\t     - mkdir -p dist/stacks/accounts
											\t\t\t\t\t\t\t      >\t     - mkdir -p dist/stacks/periodicals
											\t\t\t\t\t\t\t      >\t     - cp package.json yarn.lock dist
											\t\t\t\t\t\t\t      >\t-    # Make sure that library dependencies are available to a
											\t\t\t\t\t\t\t      >\t     - cp ../package.json ../yarn.lock dist/stacks
											\t\t\t\t\t\t\t      >\t     - cp -r ../stacks/accounts/dist ../stacks/accounts/packa
											\t\t\t\t\t\t\t      >\t     - cp -r ../stacks/periodicals/dist ../stacks/periodicals
											\t\t\t\t\t\t\t      >\t@@ -221,22 +205,20 @@ deploy_terraform:
											\t\t\t\t\t\t\t      >\t     url: https://api.$CI_COMMIT_REF_SLUG.flockademic.com
											\t\t\t\t\t\t\t      >\t     on_stop: stop_terraform
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t-    # This is just needed for subsequent jobs, so 1 hour sho
											\t\t\t\t\t\t\t      >\t     expire_in: 1 hour
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-     - api_url
											\t\t\t\t\t\t\t      >\t+      - api_url
											\t\t\t\t\t\t\t      >\t stop_terraform:
											\t\t\t\t\t\t\t      >\t   stage: deploy-backend
											\t\t\t\t\t\t\t      >\t   image:
											\t\t\t\t\t\t\t      >\t     name: hashicorp/terraform:0.11.2
											\t\t\t\t\t\t\t      >\t     entrypoint:
											\t\t\t\t\t\t\t      >\t-      # These values provided by https://github.com/hashicor
											\t\t\t\t\t\t\t      >\t-      - '/usr/bin/env'
											\t\t\t\t\t\t\t      >\t-      - 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/
											\t\t\t\t\t\t\t      >\t+      - /usr/bin/env
											\t\t\t\t\t\t\t      >\t+      - PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/b
											\t\t\t\t\t\t\t      >\t   variables:
											\t\t\t\t\t\t\t      >\t     GIT_STRATEGY: none
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - build_terraform
											\t\t\t\t\t\t\t      >\t+    - build_terraform
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export 
											\t\t\t\t\t\t\t      >\t     - export TF_VAR_aws_account_id=$AWS_ACCOUNT_ID
											\t\t\t\t\t\t\t      >\t@@ -249,11 +231,6 @@ stop_terraform:
											\t\t\t\t\t\t\t      >\t     - export TF_VAR_orcid_client_id="irrelevant_for_undeploy
											\t\t\t\t\t\t\t      >\t     - export TF_VAR_orcid_client_secret="irrelevant_for_unde
											\t\t\t\t\t\t\t      >\t     - export TF_VAR_frontend_url="irrelevant_for_undeploymen
											\t\t\t\t\t\t\t      >\t-    # Use the branch/tag name as the TerraForm Workspace,
											\t\t\t\t\t\t\t      >\t-    # limited to 26 chars (30 is the max length of Heroku ap
											\t\t\t\t\t\t\t      >\t-    # and with a potential trailing dash stripped
											\t\t\t\t\t\t\t      >\t-    # (Note that I'd rather name this $TF_WORKSPACE, but:
											\t\t\t\t\t\t\t      >\t-    # https://github.com/hashicorp/terraform/issues/15874 )
											\t\t\t\t\t\t\t      >\t     - export WORKSPACE_NAME=`echo $CI_COMMIT_REF_SLUG | cut 
											\t\t\t\t\t\t\t      >\t     - terraform init -backend-config="region=$TF_VAR_aws_reg
											\t\t\t\t\t\t\t      >\t     - terraform workspace select $WORKSPACE_NAME
											\t\t\t\t\t\t\t      >\t@@ -264,22 +241,15 @@ stop_terraform:
											\t\t\t\t\t\t\t      >\t   environment:
											\t\t\t\t\t\t\t      >\t     name: review_api/$CI_COMMIT_REF_SLUG
											\t\t\t\t\t\t\t      >\t     action: stop
											\t\t\t\t\t\t\t      >\t-
											\t\t\t\t\t\t\t      >\t provision_databases:
											\t\t\t\t\t\t\t      >\t   stage: provision-backend
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - deploy_terraform
											\t\t\t\t\t\t\t      >\t+    - deploy_terraform
											\t\t\t\t\t\t\t      >\t   image: alpine:3.6
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - apk add --no-cache curl jq postgresql-client
											\t\t\t\t\t\t\t      >\t-    # Use the branch/tag name as the TerraForm Workspace,
											\t\t\t\t\t\t\t      >\t-    # limited to 26 chars (30 is the max length of Heroku ap
											\t\t\t\t\t\t\t      >\t-    # and with a potential trailing dash stripped
											\t\t\t\t\t\t\t      >\t-    # (Note that I'd rather name this $TF_WORKSPACE, but:
											\t\t\t\t\t\t\t      >\t-    # https://github.com/hashicorp/terraform/issues/15874 )
											\t\t\t\t\t\t\t      >\t     - export WORKSPACE_NAME=`echo $CI_COMMIT_REF_SLUG | cut 
											\t\t\t\t\t\t\t      >\t-    - "DATABASE_URL=`curl -X GET \\"https://api.heroku.com/ap
											\t\t\t\t\t\t\t      >\t-    # $DATABASE_URL is of the form `postgres://<username>:<p
											\t\t\t\t\t\t\t      >\t+    - 'DATABASE_URL=`curl -X GET "https://api.heroku.com/app
											\t\t\t\t\t\t\t      >\t     - export PGHOST=`echo ${DATABASE_URL:11} | cut -d '@' -f
											\t\t\t\t\t\t\t      >\t     - export PGPORT=`echo ${DATABASE_URL:11} | cut -d '@' -f
											\t\t\t\t\t\t\t      >\t     - export PGUSER=`echo ${DATABASE_URL:11} | cut -d '@' -f
											\t\t\t\t\t\t\t      >\t@@ -287,15 +257,13 @@ provision_databases:
											\t\t\t\t\t\t\t      >\t     - echo "$PGHOST:$PGPORT:$PGDATABASE:$PGUSER:`echo ${DATA
											\t\t\t\t\t\t\t      >\t     - chmod 0600 .pgpass.conf
											\t\t\t\t\t\t\t      >\t     - export PGPASSFILE=.pgpass.conf
											\t\t\t\t\t\t\t      >\t-    # Create the databases and provision them:
											\t\t\t\t\t\t\t      >\t     - sh stacks/provision_databases.sh stacks
											\t\t\t\t\t\t\t      >\t-
											\t\t\t\t\t\t\t      >\t build_frontend:
											\t\t\t\t\t\t\t      >\t   stage: build-frontend
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - prepare
											\t\t\t\t\t\t\t      >\t-   - prepare_frontend
											\t\t\t\t\t\t\t      >\t-   - deploy_terraform
											\t\t\t\t\t\t\t      >\t+    - prepare
											\t\t\t\t\t\t\t      >\t+    - prepare_frontend
											\t\t\t\t\t\t\t      >\t+    - deploy_terraform
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - cd stacks/frontend
											\t\t\t\t\t\t\t      >\t     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export 
											\t\t\t\t\t\t\t      >\t@@ -306,17 +274,14 @@ build_frontend:
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 month
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - stacks/frontend/dist/
											\t\t\t\t\t\t\t      >\t-    # The below files are needed for the undeploy jobs,
											\t\t\t\t\t\t\t      >\t-    # because when undeploying the branch (and thus these fi
											\t\t\t\t\t\t\t      >\t-    - stacks/frontend/package.json
											\t\t\t\t\t\t\t      >\t-    - stacks/frontend/build/
											\t\t\t\t\t\t\t      >\t-
											\t\t\t\t\t\t\t      >\t+      - stacks/frontend/dist/
											\t\t\t\t\t\t\t      >\t+      - stacks/frontend/package.json
											\t\t\t\t\t\t\t      >\t+      - stacks/frontend/build/
											\t\t\t\t\t\t\t      >\t deploy_frontend:
											\t\t\t\t\t\t\t      >\t   stage: deploy-frontend
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - prepare_frontend
											\t\t\t\t\t\t\t      >\t-   - build_frontend
											\t\t\t\t\t\t\t      >\t+    - prepare_frontend
											\t\t\t\t\t\t\t      >\t+    - build_frontend
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - cd stacks/frontend
											\t\t\t\t\t\t\t      >\t     - yarn run deploy
											\t\t\t\t\t\t\t      >\t@@ -330,8 +295,8 @@ deploy_frontend:
											\t\t\t\t\t\t\t      >\t deploy_frontend_prod:
											\t\t\t\t\t\t\t      >\t   stage: deploy-frontend
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - prepare_frontend
											\t\t\t\t\t\t\t      >\t-   - build_frontend
											\t\t\t\t\t\t\t      >\t+    - prepare_frontend
											\t\t\t\t\t\t\t      >\t+    - build_frontend
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - cd stacks/frontend
											\t\t\t\t\t\t\t      >\t     - export AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID_PRODUCTIO
											\t\t\t\t\t\t\t      >\t@@ -339,8 +304,6 @@ deploy_frontend_prod:
											\t\t\t\t\t\t\t      >\t     - yarn run deploy
											\t\t\t\t\t\t\t      >\t     - yarn run awaitDeployTasks
											\t\t\t\t\t\t\t      >\t   environment:
											\t\t\t\t\t\t\t      >\t-    # Since the deploy_terraform environment cannot have dif
											\t\t\t\t\t\t\t      >\t-    # we're not doing that here either in order to be able t
											\t\t\t\t\t\t\t      >\t     name: review/$CI_COMMIT_REF_SLUG
											\t\t\t\t\t\t\t      >\t     url: https://flockademic.com
											\t\t\t\t\t\t\t      >\t   only:
											\t\t\t\t\t\t\t      >\t@@ -350,8 +313,8 @@ stop_frontend:
											\t\t\t\t\t\t\t      >\t   variables:
											\t\t\t\t\t\t\t      >\t     GIT_STRATEGY: none
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - prepare_frontend
											\t\t\t\t\t\t\t      >\t-   - build_frontend
											\t\t\t\t\t\t\t      >\t+    - prepare_frontend
											\t\t\t\t\t\t\t      >\t+    - build_frontend
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - cd stacks/frontend
											\t\t\t\t\t\t\t      >\t     - yarn run undeploy
											\t\t\t\t\t\t\t      >\t@@ -359,74 +322,67 @@ stop_frontend:
											\t\t\t\t\t\t\t      >\t   environment:
											\t\t\t\t\t\t\t      >\t     name: review/$CI_COMMIT_REF_SLUG
											\t\t\t\t\t\t\t      >\t     action: stop
											\t\t\t\t\t\t\t      >\t-
											\t\t\t\t\t\t\t      >\t e2e:firefox:
											\t\t\t\t\t\t\t      >\t   stage: confidence-check
											\t\t\t\t\t\t\t      >\t   services:
											\t\t\t\t\t\t\t      >\t     - selenium/standalone-firefox:3.13
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - prepare
											\t\t\t\t\t\t\t      >\t+    - prepare
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - if [[ $CI_COMMIT_REF_NAME == $BRANCH_IN_MAINTENANCE ]]
											\t\t\t\t\t\t\t      >\t     - yarn run confidence-check --host=selenium__standalone-
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 week
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - __e2e__/results/
											\t\t\t\t\t\t\t      >\t-    - __e2e__/errorShots/
											\t\t\t\t\t\t\t      >\t+      - __e2e__/results/
											\t\t\t\t\t\t\t      >\t+      - __e2e__/errorShots/
											\t\t\t\t\t\t\t      >\t     when: always
											\t\t\t\t\t\t\t      >\t-  # GUI tests loading a full browser are notoriously unstabl
											\t\t\t\t\t\t\t      >\t-  # See https://gitlab.com/Flockademic/Flockademic/issues/36
											\t\t\t\t\t\t\t      >\t   retry: 2
											\t\t\t\t\t\t\t      >\t e2e:chrome:
											\t\t\t\t\t\t\t      >\t   stage: confidence-check
											\t\t\t\t\t\t\t      >\t   services:
											\t\t\t\t\t\t\t      >\t     - selenium/standalone-chrome:3.13
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - prepare
											\t\t\t\t\t\t\t      >\t+    - prepare
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - if [[ $CI_COMMIT_REF_NAME == $BRANCH_IN_MAINTENANCE ]]
											\t\t\t\t\t\t\t      >\t     - yarn run confidence-check --host=selenium__standalone-
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     expire_in: 1 week
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - __e2e__/results/
											\t\t\t\t\t\t\t      >\t-    - __e2e__/errorShots/
											\t\t\t\t\t\t\t      >\t+      - __e2e__/results/
											\t\t\t\t\t\t\t      >\t+      - __e2e__/errorShots/
											\t\t\t\t\t\t\t      >\t     when: always
											\t\t\t\t\t\t\t      >\t-  # GUI tests loading a full browser are notoriously unstabl
											\t\t\t\t\t\t\t      >\t-  # See https://gitlab.com/Flockademic/Flockademic/issues/36
											\t\t\t\t\t\t\t      >\t   retry: 2
											\t\t\t\t\t\t\t      >\t-# See https://docs.gitlab.com/ce/ci/examples/sast.html
											\t\t\t\t\t\t\t      >\t sast:
											\t\t\t\t\t\t\t      >\t   stage: confidence-check
											\t\t\t\t\t\t\t      >\t   image: registry.gitlab.com/gitlab-org/gl-sast:latest
											\t\t\t\t\t\t\t      >\t   dependencies:
											\t\t\t\t\t\t\t      >\t-   - prepare
											\t\t\t\t\t\t\t      >\t-   - prepare_frontend
											\t\t\t\t\t\t\t      >\t-   - prepare_accounts
											\t\t\t\t\t\t\t      >\t-   - prepare_periodicals
											\t\t\t\t\t\t\t      >\t+    - prepare
											\t\t\t\t\t\t\t      >\t+    - prepare_frontend
											\t\t\t\t\t\t\t      >\t+    - prepare_accounts
											\t\t\t\t\t\t\t      >\t+    - prepare_periodicals
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - /app/bin/run .
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - gl-sast-report.json
											\t\t\t\t\t\t\t      >\t-# See https://docs.gitlab.com/ee/ci/examples/dast.html
											\t\t\t\t\t\t\t      >\t+      - gl-sast-report.json
											\t\t\t\t\t\t\t      >\t dast:
											\t\t\t\t\t\t\t      >\t   stage: confidence-check
											\t\t\t\t\t\t\t      >\t   image: owasp/zap2docker-weekly
											\t\t\t\t\t\t\t      >\t-  dependencies:
											\t\t\t\t\t\t\t      >\t+  dependencies: null
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - mkdir /zap/wrk/
											\t\t\t\t\t\t\t      >\t     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export 
											\t\t\t\t\t\t\t      >\t     - /zap/zap-baseline.py -J gl-dast-report.json -t $SITE_U
											\t\t\t\t\t\t\t      >\t     - cp /zap/wrk/gl-dast-report.json .
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t-    paths: [gl-dast-report.json]
											\t\t\t\t\t\t\t      >\t-# See https://docs.gitlab.com/ee/ci/examples/browser_perform
											\t\t\t\t\t\t\t      >\t+    paths:
											\t\t\t\t\t\t\t      >\t+      - gl-dast-report.json
											\t\t\t\t\t\t\t      >\t performance:
											\t\t\t\t\t\t\t      >\t   stage: confidence-check
											\t\t\t\t\t\t\t      >\t   image: docker:git
											\t\t\t\t\t\t\t      >\t-  dependencies:
											\t\t\t\t\t\t\t      >\t+  dependencies: null
											\t\t\t\t\t\t\t      >\t   services:
											\t\t\t\t\t\t\t      >\t     - docker:stable-dind
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t@@ -438,7 +394,7 @@ performance:
											\t\t\t\t\t\t\t      >\t     - mv sitespeed-results/data/performance.json performance
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t     paths:
											\t\t\t\t\t\t\t      >\t-    - performance.json
											\t\t\t\t\t\t\t      >\t+      - performance.json
											\t\t\t\t\t\t\t      >\t license_management:
											\t\t\t\t\t\t\t      >\t   stage: confidence-check
											\t\t\t\t\t\t\t      >\t   image: docker:stable
											\t\t\t\t\t\t\t      >\t@@ -449,8 +405,7 @@ license_management:
											\t\t\t\t\t\t\t      >\t     - docker:stable-dind
											\t\t\t\t\t\t\t      >\t   script:
											\t\t\t\t\t\t\t      >\t     - export LICENSE_MANAGEMENT_VERSION=$(echo "$CI_SERVER_V
											\t\t\t\t\t\t\t      >\t-    - docker run
											\t\t\t\t\t\t\t      >\t-        --volume "$PWD:/code"
											\t\t\t\t\t\t\t      >\t-        "registry.gitlab.com/gitlab-org/security-products/li
											\t\t\t\t\t\t\t      >\t+    - docker run --volume "$PWD:/code" "registry.gitlab.com/
											\t\t\t\t\t\t\t      >\t   artifacts:
											\t\t\t\t\t\t\t      >\t-    paths: [gl-license-management-report.json]
											\t\t\t\t\t\t\t      >\t+    paths:
											\t\t\t\t\t\t\t      >\t+      - gl-license-management-report.json

											"""
								}, {
									doc:      ""
									cmd:      "git add .gitlab-ci.yml internal/ci/gitlab/ cue.mod/module.cue"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# git commit -m "ci: create CUE sources for GitLab CI/CD pipelines"
											"""
									cmd:      "git commit --quiet -m \"ci: create CUE sources for GitLab CI/CD pipelines\""
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
