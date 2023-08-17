SESSION?=1-outline
SERVE_PORT?=8000

run-live: dist/live/venv/bin/livereload
	find dist/live/ -maxdepth 1 -type l -delete
	ln -s $$(pwd)/$(SESSION)/* dist/live/
	ln -s $$(pwd)/index.html dist/live/
	dist/live/venv/bin/livereload -o 0 -p $(SERVE_PORT) -d dist/live/

run-package: package
	python3 -m http.server -d dist/statics/$(SESSION) $(SERVE_PORT)

package-all:
	find . -maxdepth 1 -type d -name "*-*" -exec make package SESSION={} ";"

package:
	mkdir -p dist/statics/
	cp -r $(SESSION)/ dist/statics/
	cp index.html dist/statics/$(SESSION)/

dist/live/venv/bin/livereload:
	python3 -m venv dist/live/venv
	dist/live/venv/bin/python -m pip install livereload

clean:
	rm -rf dist/
