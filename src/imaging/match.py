# -*- coding:utf-8 -*-
import numpy
import cv2
import scipy

def selMatch(n):
    if n >= 3:
      return(True)
    else :
      return(False)

image_path_1 = 'target.png'
img1 = cv2.imread(image_path_1)
gray1= cv2.cvtColor(img1,cv2.COLOR_BGR2GRAY)
cap1 = cv2.VideoCapture(0);

ret, dumi = cap1.read()

for y in xrange(1,6):
    ret, dumi = cap1.read()

ret, img2 = cap1.read()
cv2.imwrite("out.png",img2)
cap1.release()
gray2 = cv2.cvtColor(img2,cv2.COLOR_BGR2GRAY)

# キーポイントの検出
sift = cv2.FeatureDetector_create("ORB")
keypoints1 = sift.detect(gray1)
keypoints2 = sift.detect(gray2)
# print len(keypoints1)
# print len(keypoints2)
descripter = cv2.DescriptorExtractor_create("ORB")
k1,d1 = descripter.compute(gray1, keypoints1)
k2,d2 = descripter.compute(gray2, keypoints2)

# キーの一致度合い
matcher = cv2.DescriptorMatcher_create("BruteForce-Hamming")
matches = matcher.match(d1, d2)

dist = [m.distance for m in matches]

thres_dist = (sum(dist) / len(dist)) * 0.5
sel_matches = [m for m in matches if m.distance < thres_dist]

print(selMatch(len(sel_matches)))