# Pic-Convert2Gif

Translate batch images from JPG or PNG format to GIF format, and mitigate color loss as much as possible through dithering algorithm.

## Language/语言

- [English](README_Eng.md)
- [简体中文](README.md)

## Project Description

The older versions of Tencent QQ and the current mobile version of QQ do not support the display of PNG images' alpha channels. As a result, when a PNG image is sent directly, it displays random white or black backgrounds. This issue can be resolved by converting PNG images to GIF format.

Most of the simple methods for batch conversion of PNG to GIF result in images with heavy noise and significant loss of color information. This project significantly improves the quality of resultant GIF images by tweaking the parameters within ffmpeg.

## Usage

1. Install [ffmpeg and ffprobe](https://www.ffmpeg.org/), and add them to your environment variables.
2. Download the two 'cmd' files from this project.
3. Based on file names, copy the file you want to use into the folder containing the images to be converted, and double-click to run.

## Note

The GIF images generated through this project are at a frame rate of 24 frames per second, matching the frame rate supported by Tencent QQ. If you have other requirements, please modify the 'cmd' files yourself.
