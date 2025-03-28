update_js:
	cp ./assets/js/main.js ./build/flutter_assets/js/main.js

BASE_HREF = '/Horizon/'  #/Jitendra_kohar/ represent thename of repository
GITHUB_REPO = git@github.com:vinaymahida52/Horizon.git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')
GITHUB_USER = vinaymahida52



# Deploy the Flutter web project to GitHub
deploy-web:
ifndef NAME
	$(error NAME is not set. Usage: make deploy NAME=<name>)
endif

	@echo "Getting packages..."
	flutter pub get

	@echo "Building for web..."
	flutter build web --base-href $(BASE_HREF) --release

	@echo "Deploying to git repository"
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M gh-pages && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u -f origin gh-pages

	@echo "✅ Finished deploy: $(GITHUB_REPO)"
	@echo "🚀 Flutter web URL: https://$(GITHUB_USER).github.io/$(NAME)/"

.PHONY: deploy update_js