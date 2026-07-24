#!/bin/sh

set -eu

repository="subframe7536/maple-font"
asset="MapleMono-NF-CN.zip"
font_dir="${HOME}/.local/share/fonts"
manifest="${font_dir}/.maple-mono-nf-cn-manifest"
latest_release_url="https://github.com/${repository}/releases/latest"

manifest_is_complete() {
    expected_version="${1:-}"
    first_line=true
    found_font=false

    [ -f "${manifest}" ] || return 1

    while IFS= read -r line; do
        if [ "${first_line}" = true ]; then
            first_line=false
            [ -z "${expected_version}" ] || [ "${line}" = "${expected_version}" ] || return 1
            continue
        fi

        [ -n "${line}" ] || continue
        found_font=true
        [ -f "${font_dir}/${line}" ] || return 1
    done < "${manifest}"

    [ "${found_font}" = true ]
}

latest_url="$(
    curl --fail --silent --show-error --location --head \
        --output /dev/null --write-out '%{url_effective}' \
        "${latest_release_url}"
)" || {
    if manifest_is_complete ""; then
        echo "Maple Mono: unable to check GitHub; keeping the installed version." >&2
        exit 0
    fi

    echo "Maple Mono: unable to determine the latest release." >&2
    exit 1
}

latest_version="${latest_url##*/}"
case "${latest_version}" in
    v[0-9]*)
        ;;
    *)
        echo "Maple Mono: unexpected latest release URL: ${latest_url}" >&2
        exit 1
        ;;
esac

if manifest_is_complete "${latest_version}"; then
    echo "Maple Mono ${latest_version} is already installed."
    exit 0
fi

work_dir="$(mktemp -d "${TMPDIR:-/tmp}/maple-font.XXXXXXXX")"
trap 'rm -rf "${work_dir}"' EXIT HUP INT TERM
archive="${work_dir}/${asset}"
stage_dir="${work_dir}/fonts"
mkdir -p "${stage_dir}"

download_url="https://github.com/${repository}/releases/download/${latest_version}/${asset}"
echo "Downloading Maple Mono ${latest_version}..."
curl --fail --silent --show-error --location \
    --output "${archive}" "${download_url}"
unzip -qq -j "${archive}" '*.ttf' -d "${stage_dir}"

font_count="$(
    find "${stage_dir}" -maxdepth 1 -type f -name 'MapleMono-NF-CN-*.ttf' |
        wc -l
)"
[ "${font_count}" -gt 0 ] || {
    echo "Maple Mono: ${asset} did not contain the expected fonts." >&2
    exit 1
}

if find "${stage_dir}" -maxdepth 1 -type f -name '*.ttf' \
    ! -name 'MapleMono-NF-CN-*.ttf' | grep -q .; then
    echo "Maple Mono: ${asset} contained unexpected TTF files." >&2
    exit 1
fi

mkdir -p "${font_dir}"

find "${stage_dir}" -maxdepth 1 -type f -name 'MapleMono-NF-CN-*.ttf' \
    -exec install -m 0644 {} "${font_dir}/" \;

find "${font_dir}" -maxdepth 1 -type f -name 'MapleMono-NF-CN-*.ttf' |
while IFS= read -r installed_font; do
    basename="$(basename "${installed_font}")"
    [ -f "${stage_dir}/${basename}" ] || rm -f "${installed_font}"
done

manifest_tmp="${font_dir}/.maple-mono-nf-cn-manifest.tmp.$$"
{
    printf '%s\n' "${latest_version}"
    find "${stage_dir}" -maxdepth 1 -type f -name 'MapleMono-NF-CN-*.ttf' \
        -exec basename {} \; | sort
} > "${manifest_tmp}"
mv -f "${manifest_tmp}" "${manifest}"

fc-cache -f "${font_dir}"
echo "Installed Maple Mono ${latest_version} and refreshed the font cache."
