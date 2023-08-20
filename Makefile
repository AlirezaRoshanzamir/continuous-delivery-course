SESSION?=1-outline
SERVE_PORT?=8000

run: package
	python3 -m http.server -d dist/static_website/ $(SERVE_PORT)

run-live: dist/live_website/venv/bin/livereload package-live
	dist/live_website/venv/bin/livereload -o 0 -p $(SERVE_PORT) -d dist/live_website/

package: dist/static_website/
	find . -maxdepth 1 -type d -name "*-*" -exec make package-session SESSION={} ";"
	cp index.html dist/static_website/

package-live: dist/live_website/
	find . -maxdepth 1 -type d -name "*-*" -exec make package-live-session SESSION={} ";"
	rm -f dist/live_website/index.html
	ln -s $$(pwd)/index.html dist/live_website/index.html

package-live-session: dist/live_website/
	rm -rf dist/live_website/$(SESSION)
	mkdir dist/live_website/$(SESSION)
	ln -s $$(pwd)/$(SESSION)/* dist/live_website/$(SESSION)
	ln -s $$(pwd)/session_index.html dist/live_website/$(SESSION)/index.html

package-session: dist/static_website/
	rm -rf dist/static_website/$(SESSION)
	cp -r $(SESSION) dist/static_website/
	cp session_index.html dist/static_website/$(SESSION)/index.html

dist/live_website/venv/bin/livereload:
	python3 -m venv dist/live_website/venv
	dist/live_website/venv/bin/python -m pip install livereload

dist/static_website/:
	mkdir -p dist/static_website/

dist/live_website/:
	mkdir -p dist/live_website/

clean:
	rm -rf dist/
