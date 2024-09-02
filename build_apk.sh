#! /usr/bin/env bash

REPO_DIR=mediapipe

PROJECT_BUILDER_DIR=$PWD

cd $REPO_DIR

bazel --output_base $PROJECT_BUILDER_DIR/output\
 build -c opt --config=android_arm64 \
 --verbose_failures \
 mediapipe/examples/android/src/java/com/google/mediapipe/apps/faceeffect:faceeffect

cd -
