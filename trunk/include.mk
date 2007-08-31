

.SUFFIXES: .svg .png .gif .jpg

.svg.png:
	if [ -z ${SIZE} ]; then \
		for s in ${SIZES}; do \
			mkdir -p ${EXPORT}$${s}x$${s}; \
			inkscape -e ${EXPORT}$${s}x$${s}/$@ -w $$s -h $$s $<; \
		done; \
	else \
		mkdir -p ${EXPORT}${SIZE}x${SIZE}; \
		inkscape -e ${EXPORT}${SIZE}x${SIZE}/$@ -w ${SIZE} -h ${SIZE} $<; \
	fi


.svg.bw:
	mkdir -p ${EXPORT}bw; \
	inkscape -e ${EXPORT}bw/$@ -w 256 -h 256 $<;



.png.jpg: ${ICONS:.svg=.jpg}
	if [ -z ${SIZE} ]; then \
		for s in ${SIZES}; do \
			mkdir -p ${EXPORT}$${s}x$${s}; \
			convert ${EXPORT}$${s}x$${s}/$< ${EXPORT}$${s}x$${s}/$@; \
		done; \
	else \
		mkdir -p ${EXPORT}${SIZE}x${SIZE}; \
		convert ${EXPORT}${SIZE}x${SIZE}/$< ${EXPORT}${SIZE}x${SIZE}/$@; \
	fi


.png.gif: ${ICONS:.svg=.gif}
	if [ -z ${SIZE} ]; then \
		for s in ${SIZES}; do \
			mkdir -p ${EXPORT}$${s}x$${s}; \
			convert ${EXPORT}$${s}x$${s}/$< ${EXPORT}$${s}x$${s}/$@; \
		done; \
	else \
		mkdir -p ${EXPORT}${SIZE}x${SIZE}; \
		convert ${EXPORT}${SIZE}x${SIZE}/$< ${EXPORT}${SIZE}x${SIZE}/$@; \
	fi


all: ${FORMATS} bw

png: ${ICONS:.svg=.png}

jpg: ${ICONS:.svg=.jpg}

gif: ${ICONS:.svg=.gif}


bw:
	mkdir -p ${EXPORT}bw; \
	for i in ${ICONS:.svg=}; do \
		inkscape -e ${EXPORT}bw/$${i}.png -w 256 -h 256 $${i}.svg; \
		mogrify -modulate 100,0 ${EXPORT}bw/$${i}.png; \
	done

