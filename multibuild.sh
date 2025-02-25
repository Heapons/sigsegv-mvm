#!/bin/bash

cd build/release
ambuild

pushd package
	(
		rm -f ../package-linux.zip
		type zip >/dev/null 2>&1 && zip -y -q -FSr ../package-linux.zip *
	) &
popd

wait