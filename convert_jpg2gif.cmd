chcp 65001
@echo off
setlocal enabledelayedexpansion

REM Create a subfolder for the converted GIFs
set "subfolder=converted_jpg2gif"
if not exist !subfolder! mkdir !subfolder!

for %%f in (*.jpg) do (
    set "input=%%f"
    set "output=!subfolder!\%%f_converted.gif"
    set "counter=1"

    for /f %%a in ('ffprobe -v error -select_streams v:0 -show_entries stream^=width^,height -of default^=noprint_wrappers^=1^:nokey^=1 "!input!"') do (
        if !counter! == 1 (
            set "width=%%a"
            set /a counter+=1
        ) else (
            set "height=%%a"
        )
    )

    ffmpeg -i "!input!" -s !width!x!height! -vf "[in]scale=!width!x!height!,split[split1][split2];[split1]palettegen=stats_mode=single[pal];[split2][pal]paletteuse=new=1" -r 24 "!output!"
)

endlocal

echo "Convert complete, saved in the ./converted_jpg2gif folder. Press Enter to exit the program."
echo "转换完成，已保存在 ./converted_jpg2gif 文件夹中, 按回车退出程序"
pause
