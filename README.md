# Cached Video Player

A flutter plugin that has been forked from the official [video_player](https://pub.dev/packages/video_player) package except that it supports caching in Android and iOS.
Web plugin will work like official [video_player](https://pub.dev/packages/video_player) i.e. without caching support.

## Why fork
- The original creator stopped updating/merging PRs so i'm re-publishing it
- I think exo player 2.12 was taken down today so my builds were failing. I believe android could no longer pull

`implementation 'com.google.android.exoplayer:exoplayer-core:2.12.1'`

so i updated it to
`implementation 'com.google.android.exoplayer:exoplayer-core:2.18.1'`
- got rid of deprecations
- fixed errors
- followed video_player package for guidance


## Installation

First, add `video_cached_player` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

Follow the Android and iOS configuration steps of the official [video_player](https://pub.dev/packages/video_player#installation) package. This plugin won't work in Desktop.

### Issues
* `maxFileSize` and `maxCacheSize` are hardcoded at 100MiB and 1GiB respectively in Android.

### Contributors

* [Vikram Pratap Singh](https://github.com/vikram25897)
* [EnderTan](https://github.com/EnderTan)
