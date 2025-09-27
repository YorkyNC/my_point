import 'package:upgrader/upgrader.dart';
import 'package:version/version.dart';

class UpgraderAppStoreCustom extends UpgraderAppStore {
  @override
  Future<UpgraderVersionInfo> getVersionInfo(
      {required UpgraderState state,
      required Version installedVersion,
      required String? country,
      required String? language}) async {
    final versionInfo = await super.getVersionInfo(
      state: state,
      installedVersion: installedVersion,
      country: country,
      language: language,
    );
    return UpgraderVersionInfo(
      appStoreListingURL: versionInfo.appStoreListingURL,
      appStoreVersion: versionInfo.appStoreVersion,
      installedVersion: versionInfo.installedVersion,
      isCriticalUpdate: true,
      minAppVersion: versionInfo.minAppVersion,
      releaseNotes: versionInfo.releaseNotes,
    );
  }
}

class UpgraderPlayStoreCustom extends UpgraderPlayStore {
  @override
  Future<UpgraderVersionInfo> getVersionInfo(
      {required UpgraderState state,
        required Version installedVersion,
        required String? country,
        required String? language}) async {
    final versionInfo = await super.getVersionInfo(
      state: state,
      installedVersion: installedVersion,
      country: country,
      language: language,
    );
    return UpgraderVersionInfo(
      appStoreListingURL: versionInfo.appStoreListingURL,
      appStoreVersion: versionInfo.appStoreVersion,
      installedVersion: versionInfo.installedVersion,
      isCriticalUpdate: true,
      minAppVersion: versionInfo.minAppVersion,
      releaseNotes: versionInfo.releaseNotes,
    );
  }
}