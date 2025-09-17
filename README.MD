## ffmpeg로 실시간 영상 다운받기
1. ffmpeg codec 설정하여 영상 저장(별도 변환 필요 없음)
```bash
ffmpeg -rtsp_transport tcp -i {rtsp://url} -vcodec libx264 -acodec aac -c copy {output_path/output.mp4}
```
## extract_clips.py를 이용하여 Clip 변환 자동화
1. 원본영상에서 추출할 clip의 시간 정보를 기록한 csv 파일을 준비
```csv
구분,설명,clipname,start,end,클립 시간,디스크립션
폭력,남성이 여성에게 주먹질 → 발길질,elevator_violence_001,0:08:11,0:08:44,0:00:33,
폭력,남성이 여성에게 주먹질 → 발길질(뒤에서 기습),elevator_violence_002,0:12:24,0:12:56,0:00:32,
폭력,"남성이 여성에게 주먹질 → 발길질(뒤에서 기습, 저항)",elevator_violence_003,0:14:07,0:14:44,0:00:37,
폭력,여성이 남성에게 주먹질 → 발길질,elevator_violence_004,0:10:11,0:10:32,0:00:21,
폭력,"여성이 남성에게 주먹질 → 발길질(뒤에서 기습, 저항)",elevator_violence_005,0:17:08,0:17:48,0:00:40,
폭력,멱살을 잡고 끌어내리자 → 피해자 주저앉음,elevator_violence_006,0:19:20,0:19:48,0:00:28,
폭력,말다툼 도중 어깨를 밀침 → 쌍방 폭행으로 번짐,elevator_violence_007,0:22:34,0:23:14,0:00:40,
폭력,말다툼 도중 어깨를 밀침 → 쌍방 폭행으로 번짐,elevator_violence_008,0:24:02,0:24:54,0:00:52,
폭력,남성 -> 여성 뾰족한 물체로 위협 → 발길질하여 폭행,elevator_violence_009,0:27:43,0:28:16,0:00:33,
폭력,여성 -> 남성 뾰족한 물체로 위협 → 발길질하여 폭행,elevator_violence_010,0:30:04,0:30:39,0:00:35,
폭력,행인 1인 있을 때1인이 1인을 폭행 → 쓰러진 피해자를 계속해서 폭행,elevator_violence_011,1:15:00,1:15:20,0:00:20,
폭력,노인이 중심을 잃고 쓰러짐 → 바닥에 엎드려 무반응(상),elevator_falldown_001,01:11:33,01:11:56,0:00:23,
```
2. extract_clips.py 실행
```bash
python extract_clips.py {original_video_path} {csv_file_path}


### 예시
python extract_clips.py ./original_video/gangnam2.mp4 ./clip_labeling_file/gangnam_gaepo4th_labeling_2500802.csv
```
