import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

Capture video;
OpenCV opencv;
Rectangle[] faces;

PImage pic;

void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480, 30);
  video.start();
}

void draw() {
  if (video.available()) video.read();

  opencv = new OpenCV(this, video);

  pic = loadImage("任意の画像ファイル");

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  faces = opencv.detect();

  image(opencv.getInput(), 0, 0);

  for (int i = 0; i < faces.length; i++) {
    image(pic, faces[i].x, faces[i].y, faces[i].width, faces[i].width);
    //(貼り付ける画像、ｘ座標、ｙ座標、横の長さ、縦の長さ)
    //画像の表示位置は微調整してください
  }
}
