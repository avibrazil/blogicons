SIZES=10 16 22 32 48 96 128

PROFILES=default small

FORMATS=png jpg gif

ICONS=feed.svg permalink.svg trackback.svg comment.svg share.svg edit.svg permalink2.svg permalink3.svg permalink4.svg clock.svg clock2.svg cancel.svg opml.svg download.svg upload.svg tag.svg

# Directory where to export images. Must end with a '/'.
EXPORT="export/"

all:
	for p in ${PROFILES}; do \
		make EXPORT=../${EXPORT} SIZE=${SIZE} FORMATS=${FORMATS} -C $${p} all; \
	done



png:
	for p in ${PROFILES}; do \
		make EXPORT=../${EXPORT} SIZE=${SIZE} -C $${p} png; \
	done


jpg:
	for p in ${PROFILES}; do \
		make EXPORT=../${EXPORT} SIZE=${SIZE} -C $${p} jpg; \
	done


gif:
	for p in ${PROFILES}; do \
		make EXPORT=../${EXPORT} SIZE=${SIZE} -C $${p} gif; \
	done







dist: all
	cd ..; \
	zip -r blogicons-`date +%Y%m%d`.zip blogicons



clean:
	rm -rf ${EXPORT}
