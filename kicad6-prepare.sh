#!/bin/sh

KICAD6STUFF=kicad6-stuff
CONFIGKICAD6=config-kicad/6.0

mkdir -p ${KICAD6STUFF}

git clone https://gitlab.com/kicad/libraries/kicad-symbols ${KICAD6STUFF}/kicad-symbols

OFILE=${CONFIGKICAD6}/sym-lib-table
echo "(sym_lib_table" > ${OFILE}

for i in $(find ${KICAD6STUFF}/kicad-symbols -maxdepth 1 -type f -iname '*.kicad_sym' | sort); do
	N=$(basename $i .kicad_sym)
	echo '(lib (name "'$N'")(type "KiCad")(uri "${KICAD6_SYMBOL_DIR}/'$N'.kicad_sym")(options "")(descr ""))' >> ${OFILE}
done

echo ")" >> ${OFILE}


git clone https://gitlab.com/kicad/libraries/kicad-footprints ${KICAD6STUFF}/kicad-footprints

OFILE=${CONFIGKICAD6}/fp-lib-table
echo "(fp_lib_table" > ${OFILE}

for i in $(find ${KICAD6STUFF}/kicad-footprints -maxdepth 1 -type d -name '*.pretty' | sort); do
	N=$(basename $i .pretty)
	echo '(lib (name "'$N'")(type "KiCad")(uri "${KICAD6_FOOTPRINT_DIR}/'$N'.pretty")(options "")(descr ""))' >> ${OFILE}
done

echo ")" >> ${OFILE}
