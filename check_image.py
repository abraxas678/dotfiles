import cv2
import numpy as np
import sys
import json
import pyautogui
import os
from multiprocessing import Pool, cpu_count

def find_template_scaled(screen, template, scale, threshold=0.9):
    template_h, template_w = template.shape[:2]
    width = int(template_w * scale)
    height = int(template_h * scale)
    resized_template = cv2.resize(template, (width, height))
    
    # Use TM_CCOEFF_NORMED for better performance
    result = cv2.matchTemplate(screen, resized_template, cv2.TM_CCOEFF_NORMED)
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(result)
    
    return {
        "confidence": float(max_val),
        "position": {
            "x": max_loc[0] + width//2,
            "y": max_loc[1] + height//2
        },
        "scale": scale
    }

def process_scale(args):
    screen, template, scale, threshold = args
    return find_template_scaled(screen, template, scale, threshold)

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 check_image.py <template_path> <threshold>")
        sys.exit(1)

    template_path = sys.argv[1]
    threshold = float(sys.argv[2])
    
    # Take screenshot with faster method
    screenshot = pyautogui.screenshot()
    screen = cv2.cvtColor(np.array(screenshot), cv2.COLOR_RGB2BGR)
    
    # Read template
    template = cv2.imread(template_path)
    if template is None:
        print(f"Error: Could not read template image: {template_path}")
        sys.exit(1)
    
    # Reduced number of scales for better performance
    scales = [0.75, 1.0, 1.25]
    
    # Parallel processing of scales
    with Pool(processes=min(len(scales), cpu_count())) as pool:
        args = [(screen, template, scale, threshold) for scale in scales]
        results = pool.map(process_scale, args)
    
    # Find best match
    best_match = max(results, key=lambda x: x["confidence"])
    
    if best_match["confidence"] >= threshold:
        # Save debug images only if match found
        os.makedirs('debug_screenshots', exist_ok=True)
        cv2.imwrite('debug_screenshots/screen.png', screen)
        cv2.imwrite('debug_screenshots/template.png', template)
        
        output = {
            "matches": [best_match]
        }
        print(json.dumps(output))
        sys.exit(0)
    else:
        sys.exit(1)

if __name__ == "__main__":
    main()
