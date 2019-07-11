# shellcheck disable=SC2148,SC2164

generate-notice() {

	START_YEAR=$(git show --quiet "$(git rev-list --max-parents=0 HEAD)" --format="format:%ad" --date="format:%Y" | sort | head -1)
	END_YEAR=$(git show --quiet HEAD --format="format:%ad" --date="format:%Y" | sort -r | head -1)

	function abort() {
		echo "$@" >&2
		exit 1
	}

	[ -z "$START_YEAR" ] && abort "failed to determine start date"
	[ -z "$END_YEAR" ] && abort "failed to determine end date"

	RANGE=""
	if [ "$START_YEAR" = "$END_YEAR" ]; then
		RANGE="$START_YEAR"
	else
		RANGE="${START_YEAR}-${END_YEAR}"
	fi

	git checkout -b add-license

	action=""
	if [ -e LICENSE ]; then
		action="update"
	else
		action="create"
	fi

	cat >LICENSE <<EOF
Copyright $RANGE Mark Ayers

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

	git add LICENSE

	git commit -m "$action LICENSE"

}
