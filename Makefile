# My Point Flutter App Makefile
# Автоматизация команд для разработки и развертывания

# Переменные
FLUTTER = flutter
DART = dart
PROJECT_NAME = my_point

# Цвета для вывода
GREEN = \033[0;32m
YELLOW = \033[1;33m
RED = \033[0;31m
NC = \033[0m # No Color

# Помощь
.PHONY: help
help: ## Показать справку по доступным командам
	@echo "$(GREEN)My Point Flutter App - Доступные команды:$(NC)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(YELLOW)%-20s$(NC) %s\n", $$1, $$2}'

# Установка и настройка
.PHONY: setup
setup: ## Первоначальная настройка проекта
	@echo "$(GREEN)🚀 Настройка проекта My Point...$(NC)"
	$(FLUTTER) doctor
	$(FLUTTER) pub get
	$(DART) run build_runner build --delete-conflicting-outputs
	@echo "$(GREEN)✅ Настройка завершена!$(NC)"

.PHONY: install
install: ## Установить зависимости
	@echo "$(GREEN)📦 Установка зависимостей...$(NC)"
	$(FLUTTER) pub get
	@echo "$(GREEN)✅ Зависимости установлены!$(NC)"

.PHONY: upgrade
upgrade: ## Обновить зависимости
	@echo "$(GREEN)🔄 Обновление зависимостей...$(NC)"
	$(FLUTTER) pub upgrade
	@echo "$(GREEN)✅ Зависимости обновлены!$(NC)"

# Генерация кода
.PHONY: generate
generate: ## Генерировать код (build_runner, assets, локализация)
	@echo "$(GREEN)🔧 Генерация кода...$(NC)"
	$(DART) run build_runner build --delete-conflicting-outputs
	$(FLUTTER) gen-l10n
	$(FLUTTER) packages pub run flutter_gen_runner
	@echo "$(GREEN)✅ Код сгенерирован!$(NC)"

.PHONY: watch
watch: ## Запустить генерацию кода в режиме наблюдения
	@echo "$(GREEN)👀 Запуск генерации в режиме наблюдения...$(NC)"
	$(DART) run build_runner watch --delete-conflicting-outputs

.PHONY: assets
assets: ## Генерировать assets
	@echo "$(GREEN)🖼️ Генерация assets...$(NC)"
	$(FLUTTER) packages pub run flutter_gen_runner
	@echo "$(GREEN)✅ Assets сгенерированы!$(NC)"

.PHONY: l10n
l10n: ## Генерировать локализацию
	@echo "$(GREEN)🌐 Генерация локализации...$(NC)"
	$(FLUTTER) gen-l10n
	@echo "$(GREEN)✅ Локализация сгенерирована!$(NC)"

# Запуск приложения
.PHONY: run-dev
run-dev: ## Запустить приложение в режиме разработки
	@echo "$(GREEN)🚀 Запуск приложения (DEV)...$(NC)"
	$(FLUTTER) run -t lib/main_dev.dart --flavor dev

.PHONY: run-staging
run-staging: ## Запустить приложение в режиме staging
	@echo "$(GREEN)🚀 Запуск приложения (STAGING)...$(NC)"
	$(FLUTTER) run -t lib/main_staging.dart --flavor staging

.PHONY: run-prod
run-prod: ## Запустить приложение в режиме production
	@echo "$(GREEN)🚀 Запуск приложения (PRODUCTION)...$(NC)"
	$(FLUTTER) run -t lib/main_prod.dart --flavor production --release

.PHONY: run
run: run-dev ## Запустить приложение (по умолчанию dev)

# Сборка
.PHONY: build-apk-dev
build-apk-dev: ## Собрать APK для dev
	@echo "$(GREEN)🔨 Сборка APK (DEV)...$(NC)"
	$(FLUTTER) build apk -t lib/main_dev.dart --flavor dev --release

.PHONY: build-apk-staging
build-apk-staging: ## Собрать APK для staging
	@echo "$(GREEN)🔨 Сборка APK (STAGING)...$(NC)"
	$(FLUTTER) build apk -t lib/main_staging.dart --flavor staging --release

.PHONY: build-apk-prod
build-apk-prod: ## Собрать APK для production
	@echo "$(GREEN)🔨 Сборка APK (PRODUCTION)...$(NC)"
	$(FLUTTER) build apk -t lib/main_prod.dart --flavor production --release

.PHONY: build-aab-dev
build-aab-dev: ## Собрать AAB для dev
	@echo "$(GREEN)🔨 Сборка AAB (DEV)...$(NC)"
	$(FLUTTER) build appbundle -t lib/main_dev.dart --flavor dev --release

.PHONY: build-aab-staging
build-aab-staging: ## Собрать AAB для staging
	@echo "$(GREEN)🔨 Сборка AAB (STAGING)...$(NC)"
	$(FLUTTER) build appbundle -t lib/main_staging.dart --flavor staging --release

.PHONY: build-aab-prod
build-aab-prod: ## Собрать AAB для production
	@echo "$(GREEN)🔨 Сборка AAB (PRODUCTION)...$(NC)"
	$(FLUTTER) build appbundle -t lib/main_prod.dart --flavor production --release

.PHONY: build-ios-dev
build-ios-dev: ## Собрать iOS для dev
	@echo "$(GREEN)🔨 Сборка iOS (DEV)...$(NC)"
	$(FLUTTER) build ios -t lib/main_dev.dart --flavor dev --release

.PHONY: build-ios-staging
build-ios-staging: ## Собрать iOS для staging
	@echo "$(GREEN)🔨 Сборка iOS (STAGING)...$(NC)"
	$(FLUTTER) build ios -t lib/main_staging.dart --flavor staging --release

.PHONY: build-ios-prod
build-ios-prod: ## Собрать iOS для production
	@echo "$(GREEN)🔨 Сборка iOS (PRODUCTION)...$(NC)"
	$(FLUTTER) build ios -t lib/main_prod.dart --flavor production --release

.PHONY: build-web
build-web: ## Собрать веб-версию
	@echo "$(GREEN)🔨 Сборка Web...$(NC)"
	$(FLUTTER) build web --release

# Тестирование
.PHONY: test
test: ## Запустить тесты
	@echo "$(GREEN)🧪 Запуск тестов...$(NC)"
	$(FLUTTER) test

.PHONY: test-coverage
test-coverage: ## Запустить тесты с покрытием
	@echo "$(GREEN)🧪 Запуск тестов с покрытием...$(NC)"
	$(FLUTTER) test --coverage
	genhtml coverage/lcov.info -o coverage/html

.PHONY: integration-test
integration-test: ## Запустить интеграционные тесты
	@echo "$(GREEN)🧪 Запуск интеграционных тестов...$(NC)"
	$(FLUTTER) drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart

# Анализ кода
.PHONY: analyze
analyze: ## Анализ кода
	@echo "$(GREEN)🔍 Анализ кода...$(NC)"
	$(FLUTTER) analyze

.PHONY: format
format: ## Форматирование кода
	@echo "$(GREEN)✨ Форматирование кода...$(NC)"
	$(DART) format lib/ test/

.PHONY: format-check
format-check: ## Проверка форматирования
	@echo "$(GREEN)✨ Проверка форматирования...$(NC)"
	$(DART) format --output=none --set-exit-if-changed lib/ test/

.PHONY: lint
lint: analyze format-check ## Полная проверка кода

# Иконки и splash screen
.PHONY: icons-dev
icons-dev: ## Генерировать иконки для dev
	@echo "$(GREEN)🎨 Генерация иконок (DEV)...$(NC)"
	$(FLUTTER) pub run flutter_launcher_icons:main -f flutter_launcher_icons-dev.yaml

.PHONY: icons-staging
icons-staging: ## Генерировать иконки для staging
	@echo "$(GREEN)🎨 Генерация иконок (STAGING)...$(NC)"
	$(FLUTTER) pub run flutter_launcher_icons:main -f flutter_launcher_icons-stage.yaml

.PHONY: icons-prod
icons-prod: ## Генерировать иконки для production
	@echo "$(GREEN)🎨 Генерация иконок (PRODUCTION)...$(NC)"
	$(FLUTTER) pub run flutter_launcher_icons:main -f flutter_launcher_icons-prod.yaml

.PHONY: splash
splash: ## Генерировать splash screen
	@echo "$(GREEN)💫 Генерация splash screen...$(NC)"
	$(FLUTTER) pub run flutter_native_splash:create -f main

.PHONY: icons-all
icons-all: icons-dev icons-staging icons-prod ## Генерировать все иконки

# Очистка
.PHONY: clean
clean: ## Очистить проект
	@echo "$(GREEN)🧹 Очистка проекта...$(NC)"
	$(FLUTTER) clean
	rm -rf build/
	rm -rf .dart_tool/
	@echo "$(GREEN)✅ Проект очищен!$(NC)"

.PHONY: clean-all
clean-all: clean ## Полная очистка включая зависимости
	@echo "$(GREEN)🧹 Полная очистка...$(NC)"
	rm -rf pubspec.lock
	cd ios && rm -rf Pods/ Podfile.lock
	cd android && ./gradlew clean
	@echo "$(GREEN)✅ Полная очистка завершена!$(NC)"

# Fastlane
.PHONY: android-beta
android-beta: ## Деплой Android в beta (через Fastlane)
	@echo "$(GREEN)🚀 Деплой Android beta...$(NC)"
	cd android && bundle exec fastlane beta

.PHONY: android-production
android-production: ## Деплой Android в production (через Fastlane)
	@echo "$(GREEN)🚀 Деплой Android production...$(NC)"
	cd android && bundle exec fastlane production

.PHONY: ios-beta
ios-beta: ## Деплой iOS в TestFlight (через Fastlane)
	@echo "$(GREEN)🚀 Деплой iOS beta...$(NC)"
	cd ios && bundle exec fastlane beta

.PHONY: ios-production
ios-production: ## Деплой iOS в App Store (через Fastlane)
	@echo "$(GREEN)🚀 Деплой iOS production...$(NC)"
	cd ios && bundle exec fastlane production

# Утилиты
.PHONY: doctor
doctor: ## Проверить настройки Flutter
	@echo "$(GREEN)🩺 Flutter Doctor...$(NC)"
	$(FLUTTER) doctor -v

.PHONY: devices
devices: ## Показать подключенные устройства
	@echo "$(GREEN)📱 Подключенные устройства:$(NC)"
	$(FLUTTER) devices

.PHONY: version
version: ## Показать версию приложения
	@echo "$(GREEN)📋 Версия приложения:$(NC)"
	@grep "version:" pubspec.yaml

.PHONY: deps-outdated
deps-outdated: ## Показать устаревшие зависимости
	@echo "$(GREEN)📦 Устаревшие зависимости:$(NC)"
	$(FLUTTER) pub outdated

# Комбинированные команды
.PHONY: fresh-start
fresh-start: clean install generate ## Свежий старт проекта
	@echo "$(GREEN)🎉 Проект готов к работе!$(NC)"

.PHONY: full-build-android
full-build-android: clean install generate build-aab-prod ## Полная сборка Android
	@echo "$(GREEN)🎉 Android сборка завершена!$(NC)"

.PHONY: full-build-ios
full-build-ios: clean install generate build-ios-prod ## Полная сборка iOS
	@echo "$(GREEN)🎉 iOS сборка завершена!$(NC)"

.PHONY: pre-commit
pre-commit: format analyze test ## Проверки перед коммитом
	@echo "$(GREEN)✅ Код готов к коммиту!$(NC)"

# Git hooks
.PHONY: install-hooks
install-hooks: ## Установить git hooks
	@echo "$(GREEN)🪝 Установка git hooks...$(NC)"
	@echo '#!/bin/sh\nmake pre-commit' > .git/hooks/pre-commit
	@chmod +x .git/hooks/pre-commit
	@echo "$(GREEN)✅ Git hooks установлены!$(NC)"

# По умолчанию показываем помощь
.DEFAULT_GOAL := help



