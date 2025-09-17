#!/bin/bash

# 강남구청 IP 정보
1. IP : 192.168.1.233
2. subnet : 24
3. Gateway : 192.168.1.1
# 개포 1동 rtsp
ffplay rtsp://admin:admin1357%21%21@192.168.1.213:554/profile2/media.smp
# 개포 4동 rtsp
ffplay rtsp://admin:best4660%21@192.168.1.128:554/media/1/1Profile1
# 삼성 2동 rtsp
ffplay rtsp://admin:4321@192.168.1.200:4524/12

---
## ffmpeg 영상 저장
# 1. 수동종료(ctrl+c)
ffmpeg -rtsp_transport tcp -i rtsp://주소 -c copy output.mkv

##2. 시작시점, 지속시간지정(10초 뒤 부터 20초 저장)
ffmpeg -rtsp_transport tcp -ss 10 -i rtsp://주소 -t 20 -c copy ouput.mp4

##3. 변환없이 코덱 설정하여 영상 저장
ffmpeg -rtsp_transport tcp -i rtsp://admin:best4660%21@192.168.1.128:554/media/1/1Profile1 -vcodec libx264 -acodec aac -c copy test_2.mp4

---
## ffmpeg 영상 변환
ffplay -i input.avi -vcodec libx264 -acodec aac output.mp4
## ffmpeg 영상 자르기(-ss : 시작시간, -t : 실행시간)
ffmpeg -ss 00:00:00 -i ./original_video/test_2.mp4 -t 00:00:02 -vcodec libx264 -acodec aac -c copy change_video/test_clip.mp4 

---
### ffplay 실행 안될 때
#1. ffmpeg로 코덱 및 픽셀 변경하여 출력
ffmpeg -rtsp_transport tcp -i rtsp://admin:best4660%21@192.168.1.128:554/media/1/1Profile1 -f matroska -c copy - | ffplay -

#2. ffmpeg로 영상 다운 후 ffplay 확인
ffmpeg -rtsp_transport tcp -i rtsp://admin:best4660%21@192.168.1.128:554/media/1/1Profile1 -t 10 -c copy test.mp4
ffplay test.mp4

#3. analyzeduration, probersize 시간늘려주기
ffplay -rtsp_transport tcp -analyzeduration 10M -probesize 20M rtsp://admin:best4660%21@192.168.1.128:554/media/1/1Profile1