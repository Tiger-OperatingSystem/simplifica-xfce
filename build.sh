#!/bin/bash

[ ! "${EUID}" = "0" ] && {
  echo "Execute esse script como root:"
  echo
  echo "  sudo ${0}"
  echo
  exit 1
}

HERE="$(dirname "$(readlink -f "${0}")")"

working_dir=$(mktemp -d)

mkdir -p "${working_dir}/usr/bin"
mkdir -p "${working_dir}/etc/apt/apt.conf.d/"
mkdir -p "${working_dir}/DEBIAN/"

cp -v "${HERE}/config" "${HERE}/simplifica-xfce"        "${working_dir}/usr/bin"
cp -v "${HERE}/config" "${HERE}/20simplifica-xfce.conf" "${working_dir}/etc/apt/apt.conf.d"

chmod a+x "${working_dir}/usr/bin/simplifica-xfce"

(
 echo "Package: simplifica-xfce"
 echo "Priority: optional"
 echo "Version: 1.0"
 echo "Architecture: all"
 echo "Maintainer: Natanael Barbosa Santos"
 echo "Depends: "
 echo "Description: $(cat ${HERE}/README.md  | sed -n '1p')"
 echo
) > "${working_dir}/DEBIAN/control"

dpkg -b ${working_dir}
rm -rfv ${working_dir}

mv "${working_dir}.deb" "${HERE}/simplifica-xfce.deb"

chmod 777 "${HERE}/simplifica-xfce.deb"
chmod -x  "${HERE}/simplifica-xfce.deb"
