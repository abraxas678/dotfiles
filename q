[1mdiff --git a/bin/create_ln6-3.sh b/bin/create_ln6-3.sh
index c839a0ab1e87ed54ef684fbc7eb94fb274eba40d..8a07a736cff170c1c0bbef855274d6d11a15d1a3 100775
--- a/bin/create_ln6-3.sh
+++ b/bin/create_ln6-3.sh[m
[36m@@ -1,29 +1,17 @@[m
 #!/bin/bash
[31m-# Set text colors for better output visibility[m
[31m-GREEN='\033[0;32m'[m
[31m-BLUE='\033[0;34m'[m
[31m-NC='\033[0m' # No Color[m
 
[31m-echo -e "${BLUE}Video Symlink Organization Script${NC}"[m
[31m-echo -e "${GREEN}This script scans for video symlinks in the current directory"[m
[31m-echo -e "and moves files shorter than 30 seconds to a 'short_video' folder.${NC}"[m
[31m-echo "----------------------------------------"[m
[32m+echo "🔍 Scanning for video files in current directory..."[m
 
 # Create short_video directory if it doesn't exist
 mkdir -p short_video
 
[31m-# Count total number of symlinks to process[m
[31m-total_links=$(find . -maxdepth 1 -type l | wc -l)[m
[31m-current=0[m
[31m-[m
 # Process all symbolic links that point to video files
 for file in *; do
     if [ -L "$file" ]; then
[31m-        ((current++))[m
         # Get the actual file the symlink points to
         target=$(readlink -f "$file")
         
[31m-        echo -e "📺 Checking duration for: $file ${BLUE}($current of $total_links)${NC}"[m
[32m+        echo "📺 Checking duration for: $file"[m
         
         # Get duration in seconds using ffprobe
         duration=$(ffprobe -v quiet -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$target" 2>/dev/null)
[36m@@ -46,4 +34,4 @@[m         echo "-------------------"
     fi
 done
 
[31m-echo "✅ Processing complete!"
\ No newline at end of file[m
[32m+echo "✅ Processing complete!"[m
