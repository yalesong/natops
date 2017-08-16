# NATOPS Aircraft Handling Signals Database

![alt text](https://github.com/yalesong/natops/blob/master/images/natops1.jpg "natops")![alt text](https://github.com/yalesong/natops/blob/master/images/natops2.jpg "natops")

This repository contains the NATOPS Aircraft Handling Signals database, described in our FG2011 paper **"Tracking Body and Hands For Gesture Recognition: NATOPS Aircraft Handling Signals Database."**.


## Introduction
The Naval Air Training and Operating Procedures Standardization (NATOPS) manual standardizes general flight and operating procedures for the US naval aircraft. There are a large number of publications that belong to NATOPS; among the many, an aircraft signals manual (NAVAIR 00-80T-113) contains information about all aircraft systems including general aircraft and carrier flight deck handling signals. 

![alt text](https://github.com/yalesong/natops/blob/master/images/natops.png "NATOPS Aircraft Handling Signals Database")

We selected 24 NATOPS aircraft handling signals, the gestures most often used in routine practice on the deck environment. A stereo camera was used to collect this database, producing 320 x 240 pixel resolution images at 20 FPS. Twenty subjects repeated each of 24 gestures 20 times, resulting in 400 samples for each gesture class (24 gestures x 400 samples/gesture = 9,600 samples in total). Each sample had a unique duration; the average length of all samples was 2.34 sec (std.dev=0.62). 

Videos were recorded in a closed room environment with a constant illuminating condition, and with positions of cameras and subjects fixed throughout the recording.

## Download
Upon cloning this repo, run
```
$ download_natops.sh
```
The script will download the entire dataset and unzip video files into corresponding directories under `./data/gesture[xx]` where xx is the gesture index in the range of 01 to 24. Under each directory, you will see three types of AVI format files:
```
gXXsYY.avi    RGB data
gXXSYYm.avi   MASK data
gXXsYYd.avi   DEPTH MAP data
where XX (01~24) is the gesture index, YY (01~20) is the subject index. 
```
Each subject performed each gesture 20 times. So you get 400 samples per gesture.
 
Three additional files:
1. **segmentation.txt** contains ground truth gesture segmentation labels 
2. **precomputed_features.zip** contains precomputed features (2D joint angles (x,y), 3D joint positions (x,y,z), SVM-output of hand pose classification (both the label and probabilities).
3. **body_hand_pose_s20.zip** contains ground truth body and hand poses for one of the 20 subjects: subject \#20. 
    1. Body pose labels were obtained using the Vicon motion capture system, wearing markers on different parts of the body and tracking their 3D locations.
    2. Hand pose labels were obtained by manual annotation. Label categories are 0: others, 1: thumb up, 2: thumb down, 3: open palm, 4: closed palm.

The precomputed feature data comes in Matlab format, which can be downloaded at:
http://mug.csail.mit.edu/natops/data/NATOPS24.mat

## MATLAB data
In the MAT data file, you will find two cell-array variables: seqs and labels. Each element in seqs is a 20-by-T_{i} matrix, where T_{i} is the length of the i-th sample. Each element in labels is a 1-by-T_{i} vector, and it represent the label of each sequence. The 20 features we provide are
```
01	Left-Elbow x-axis joint angle first derivative
02	Left-Elbow y-axis joint angle first derivative
03	Left-Elbow z-axis joint angle first derivative
04	Left-Wrist x-axis joint angle first derivative
05	Left-Wrist y-axis joint angle first derivative
06	Left-Wrist z-axis joint angle first derivative
07	Right-Elbow x-axis joint angle first derivative
08	Right-Elbow y-axis joint angle first derivative
09	Right-Elbow z-axis joint angle first derivative
10	Right-Wrist x-axis joint angle first derivative
11	Right-Wrist y-axis joint angle first derivative
12	Right-Wrist z-axis joint angle first derivative
13	Left Hand Palm Opened
14	Left Hand Palm Closed
15	Left Hand Thumb Up
16	Left Hand Thumb Down
17	Right Hand Palm Opened
18	Right Hand Palm Closed
19	Right Hand Thumb Up
20	Right Hand Thumb Down
```

## Reference
Yale Song, David Demirdjian, and Randall Davis. **"Tracking Body and Hands For Gesture Recognition: NATOPS Aircraft Handling Signals Database."** In Proceedings of the 9th IEEE International Conference on Automatic Face and Gesture Recognition (FG 2011). Santa Barbara, CA, March 2011
