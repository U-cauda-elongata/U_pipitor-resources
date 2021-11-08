#!/bin/bash

set -ex

show_feeds() {
	# shellcheck disable=SC2016
	sed -E 's!^(.+)$!- [`Feed "\1"`](\1)!' "$@"
}

show_twitter() {
	# shellcheck disable=SC2016
	sed -E 's!^([0-9]+)$!- [`Twitter \1`](https://twitter.com/intent/user?user_id=\1)!' "$@"
}

main() {
	local src
	src="$(dirname "${0}")"
	local tmp
	tmp="$(mktemp -d)"

	local head
	head="$(git rev-parse HEAD || true)"
	local old
	old="$(git rev-parse "${1}")"
	local new
	new="$(git rev-parse "${2}")"

	mkdir -p "${tmp}"/{new,old}

	git checkout --detach "${old}" 1>&2
	n_old="$(dhall --file "${src}/dhall/topicCount.dhall")"
	dhall text --file "${src}/dhall/feeds.dhall" | sort -r > "${tmp}/old/feeds"
	dhall text --file "${src}/dhall/twitter.dhall" | sort -gr > "${tmp}/old/twitter"

	git checkout --detach "${new}" 1>&2
	n_new="$(dhall --file "${src}/dhall/topicCount.dhall")"
	dhall text --file "${src}/dhall/feeds.dhall" | sort -r > "${tmp}/new/feeds"
	dhall text --file "${src}/dhall/twitter.dhall" | sort -gr > "${tmp}/new/twitter"

	${head:+git checkout "${head}"} 1>&2

	cd "${tmp}"

	cat <<-EOS
	Thank you for sending the PR! Here is a summary report.

	## Summary of the change

	EOS

	if diff -U1 old new > changes.diff; then
		echo '✅ The change does not add or remove any topic.'
	else
		grep -vxF -f old/feeds new/feeds > addition_feeds || true
		grep -vxF -f new/feeds old/feeds > deletion_feeds || true
		grep -vxF -f old/twitter new/twitter > addition_twitter || true
		grep -vxF -f new/twitter old/twitter > deletion_twitter || true

		n_add="$(($(wc -l < addition_feeds) + $(wc -l < addition_twitter)))"
		n_del="$(($(wc -l < deletion_feeds) + $(wc -l < deletion_twitter)))"

		cat <<-EOS
		The change includes $n_add new topic(s) and $n_del removed topic(s).

		### New topics

		EOS
		if (( n_add )); then
			show_feeds addition_feeds
			show_twitter addition_twitter
		else
			echo '_None_'
		fi
		cat <<-EOS

		### Removed topics

		EOS
		if (( n_del )); then
			show_feeds deletion_feeds
			show_twitter deletion_twitter
		else
			echo '_None_'
		fi
		if (( n_old + n_add != n_new + n_del )); then
			cat <<-EOS

			### Diff

			The change might have duplicate additions or deletions.
			Below is the diff of the full topic list.

			\`\`\`diff
			EOS
			cat changes.diff
			echo '```'
		fi
	fi

	rm -rf "${tmp}"
}

main "${@}"
