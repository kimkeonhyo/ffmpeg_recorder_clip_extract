#!/bin/bash

INPUT_DIR="./original_video"
OUTPUT_DIR="./change_video"

# 출력 디렉터리 없으면 생성
mkdir -p "$OUTPUT_DIR"

# .mp4 파일 반복 처리
for input_path in "$INPUT_DIR"/*; do
    # 파일 이름만 추출 (확장자 포함)
    filename=$(basename "$input_path")
    ehco "$filename 변환 시작"
    output_path="$OUTPUT_DIR/$filename"

    echo "🔄 변환 중: $filename"

    ffmpeg -i "$input_path" -vcodec libx264 -acodec aac "$output_path"

    echo "✅ 저장 완료: $output_path"
done

echo "🎉 모든 변환 완료!"