update_js:
	cp ./assets/js/main.js ./build/flutter_assets/js/main.js

# Deploy the Flutter web project to GitHub
deploy-web:
ifndef NAME
	$(error NAME is not set. Usage: make deploy NAME=<name>)
endif

	@echo "Getting packages..."
	flutter pub get

	@echo "Building for web..."
	flutter build web --base-href "/" --release 

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

.PHONY: deploy