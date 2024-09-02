#! /usr/bin/env bash

REPO_DIR=mediapipe

git clone --single-branch --depth 1 --branch v0.10.15 git@github.com:google-ai-edge/mediapipe.git $REPO_DIR

# export ANDROID_HOME=""
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/25.2.9519653"

# Some version of bazel not support reading enviroment variable ANDROID_NDK_HOME or ANDROID_HOME
# so we must mannully do this
echo "android_sdk_repository(name = \"androidsdk\", build_tools_version = \"30.0.3\", api_level = 33, path = \"$ANDROID_HOME\")" >> $REPO_DIR/WORKSPACE
echo "android_ndk_repository(name = \"androidndk\", api_level = 21, path = \"$ANDROID_NDK_HOME\")" >> $REPO_DIR/WORKSPACE
echo "bind(name = \"android/crosstool\", actual = \"@androidndk//:toolchain\")" >> $REPO_DIR/WORKSPACE
