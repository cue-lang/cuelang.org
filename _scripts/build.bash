#!/usr/bin/env bash

set -eux

# build.bash is used to build the site ready for deploy.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Caching
# =======
# Somewhat confusingly below there are two mentions of the word "cache". Pages
# have caches in the form of gen_cache.cue files that determine whether a page
# script needs to be re-run or not by the preprocessor. Separately, when a page
# is (re-)run, the page can opt in to using a docker cache volume that is
# shared with other pages. The cache volume, for example, is used to create a
# shared Go cache between pages to optimise module download, Go builds etc.
#
# The following are largely orthogonal concerns that are accordingly afforded
# different flags in the preprocessor:
#
# * Whether gen_cache.cue files should initially be consulted to determine a
#   cache hit or otherwise: --skipcache
# * Whether gen_cache.cue files should be treated read-only (i.e. an error in
#   case of cache miss): --readonlycache
# * Whether a docker cache volume is available or not: --nocachevolume
#
# Bash variables named similarly to the flag names are used to hold the setting
# or otherwise of a flag.
#
# We have three environments in which this script runs:
#
# * Locally, in development
# * In CI, both as part of a trybot run, or on the default branch post submit
# * In Netlify during deploy
#
# Rather than declare a "fall-through" of logic, each environment is separately
# handled with comments to make clear the logic/reasoning behind each flag value.

if [[ "${NETLIFY:-}" == "true" ]]; then
	# Netlify

	# We must have a cache hit in all gen_cache.cue files; setting
	# --readonlycache ensures we fail early in case there is a cache miss,
	# instead of re-running a page (which we cannot and do not want to do in
	# Netlify)
	readonlycache="--readonlycache"

	# We don't care about timing commands because we should have a cache hit and
	# hence the "run" should be fast as we quickly determine whethwe we have a
	# full cache hit or not.
	time=""

	# We don't need a cache volume because we must have a cache hit. Setting
	# --nocachevolume is required to avoid the preprocessor eagerly creating
	# a docker volume. Netlify does not have docker available so if we did not
	# set this flag then the eager volume creation would fail.
	nocachevolume="--nocachevolume"

	# --skipcache cannot be set when --readonlycache is set. The setting of
	# --readonlycache above dominates in this case (per its motivation), and
	# hence we do not set --skipcache. In other words, if we want to ensure a
	# cache hit, we cannot skip reading the cache.
	skipcache=""

	# This is a production build, so minify the Hugo output.
	minify="--minify"

elif [[ "${CI:-}" == "true" ]]; then
	# CI - not forgetting there are two main "sub" environments: in the main
	# repo (typically workflows are run when CLs are submitted) and in the
	# trybot repo (a low privilege environment where workflows run as part of
	# the review of CLs).

	# By default in CI we skip the reading of gen_cache.cue files. This is a safe
	# default in the main repo on the default branch, because we want to catch
	# stale gen_cache.cue files that slip through.
	skipcache="--skipcache"

	if [[ "${CI_NO_SKIP_CACHE:-}" == "true" ]]; then
		# Skipping gen_cache.cue files means however we do a full re-run of each
		# page. That is expensive. Doing so, for example, when we are running the
		# trybots as part of a CL, would cause painfully slow CI runs. Especially
		# when we have the safe fallback default behaviour described above post
		# submit.
		#
		# Hence in workflows we set CI_NO_SKIP_CACHE=true. This has the effect of
		# signalling to this script that is is safe/intended/etc to use
		# gen_cache.cue files where there is a hit. The main example here is in
		# the $repo-trybot repo, when the trybots run on CLs. When
		# CI_NO_SKIP_CACHE=true, therefore we do not want to set --skipcache,
		# hence we set skipcache to empty.
		skipcache=""
	fi

	# Use a cache volume for this build. Whether the docker volume itself is
	# cached between CI runs (regardless of the repository) is not controlled
	# here; that is a function of the caching policy set in actions/cache/*
	# actions. Currently, docker volumes are _not_ part of the actions/cache
	# caches in any environment. For now, the use of a cache volume in CI simply
	# ensures that pages that opt in to use the cache volume use a shared disk.
	# Whilst they will race to fill caches like the Go modules cache, it does
	# optimise some redundant network work between pages as the cache gets
	# populated, even in a single run. Given that we do want a cache volume, we
	# therefore do not set --nocachevolume.
	nocachevolume=""

	# We want to write to gen_cache.cue files, hence the cache must not be
	# readonly. Notice this is orthogonal but related to whether --skipcache is
	# set or not for the initial cache read of gen_cache.cue files. Therefore
	# do not set --readonlycache.
	readonlycache=""

	# It's useful to see timings on steps, especially when we skip the cache.
	# Because this helps us diagnose when things "blow up" and take a long time.
	time="time -p"

	# We only want to minify Hugo output at deploy time. Therefore do not set
	# --minify for Hugo.
	minify=""

else
	# Local development

	# Use gen_cache.cue files locally. Therefore do not set --skipcache.
	skipcache=""

	# Locally we are likely to be making changes, hence the gen_cache.cue files
	# must not be readonly. Therefore do not set --readonly.
	readonlycache=""

	# Locally we are likely to be making changes, hence want the benefif of a
	# shared docker volume on pages that opt in. Therefore do not set
	# --nocachevolume.
	nocachevolume=""

	# It's useful to see timings on steps, especially when we skip the cache.
	# Because this helps us diagnose when things "blow up" and take a long time.
	time="time -p"

	# We only want to minify Hugo output at deploy time. Therefore do not set
	# --minify for Hugo.
	minify=""

fi

# Build playground
bash playground/_scripts/build.bash

# Build the docker image as required (it is a no-op if it exists) but only if
# we are not on Netlify (because if we are we don't have docker and we have
# zero intention of running anything).
if [[ "${NETLIFY:-}" != "true" ]]
then
	bash _scripts/buildDockerImage.bash
fi

# Run the preprocessor
bash _scripts/runPreprocessor.bash execute $readonlycache $nocachevolume $skipcache

# Main site
cd hugo
$time npm ci
$time hugo --cleanDestinationDir $minify $@
