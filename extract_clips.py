import csv
import subprocess
import os
import sys

# ✅ 아규먼트: 원본 영상 파일, CSV 파일
if len(sys.argv) < 3:
    print("❌ 사용법: python extract_clips.py <영상파일명> <CSV파일명>")
    sys.exit(1)

video_file = sys.argv[1]
csv_file = sys.argv[2]
output_dir = 'clips'

# 출력 폴더 생성
os.makedirs(output_dir, exist_ok=True)

def time_to_seconds(t):
    parts = list(map(float, t.split(':'))) if ':' in t else [float(t)]
    if len(parts) == 3:
        return parts[0]*3600 + parts[1]*60 + parts[2]
    elif len(parts) == 2:
        return parts[0]*60 + parts[1]
    else:
        return parts[0]

with open(csv_file, newline='', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        start = row['start']
        end = row['end']
        clipname = row['clipname']

        output_filename = os.path.join(output_dir, f'{clipname}.mp4')

        start_sec = time_to_seconds(start)
        end_sec = time_to_seconds(end)
        duration = end_sec - start_sec

        cmd = [
            'ffmpeg',
            '-ss', str(start_sec),
            '-i', video_file,
            '-t', str(duration),
            '-c', 'copy',
            output_filename
        ]

        print(f"📤 추출 중: {clipname} ({start} ~ {end})")
        subprocess.run(cmd, check=True)

print("✅ 모든 클립 추출 완료!")
