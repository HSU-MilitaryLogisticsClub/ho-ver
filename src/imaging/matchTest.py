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
cv2.imwrite("A.png",img2)
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

print 'match: ', len(matches)
print 'min: %.3f' % min(dist)
print 'mean: %.3f' % (sum(dist) / len(dist))
print 'max: %.3f' % max(dist)
print '#selected matches:', len(sel_matches)
print(selMatch(len(sel_matches)))

# scipi必要 視覚化用

h1, w1 = img1.shape[:2]
h2, w2 = img2.shape[:2]
view = scipy.zeros((max(h1, h2), w1 + w2, 3), scipy.uint8)
view[:h1, :w1, 0] = gray1
view[:h2, w1:, 0] = gray2
view[:, :, 1] = view[:, :, 0]
view[:, :, 2] = view[:, :, 0]
 
for m in sel_matches:
    color = tuple([scipy.random.randint(0, 255) for _ in xrange(3)])
    cv2.line(view,
        (int(k1[m.queryIdx].pt[0]), int(k1[m.queryIdx].pt[1])),
        (int(k2[m.trainIdx].pt[0] + w1), int(k2[m.trainIdx].pt[1])),
         color)

cv2.imwrite('result.png', view)