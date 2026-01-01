#!/usr/bin/env python3
"""
Crystal Quest - Automated Asset Downloader
Downloads all free CC0/Public Domain game assets automatically

Usage:
    python download_assets.py

Requirements:
    - Python 3.7+
    - requests library (pip install requests)
"""

import os
import sys
import zipfile
import shutil
from pathlib import Path

try:
    import requests
except ImportError:
    print("❌ Error: 'requests' library not found.")
    print("📦 Installing requests...")
    os.system(f"{sys.executable} -m pip install requests")
    import requests

# Asset download URLs (direct links to free CC0 packs)
ASSETS = {
    "kenney_dungeon": {
        "name": "Kenney Dungeon Kit",
        "url": "https://kenney.nl/content/3-assets/16-dungeon-kit/dungeonkit.zip",
        "extract_to": "assets/models/environment/dungeon",
        "type": "3d_models"
    },
    "kenney_platformer": {
        "name": "Kenney Platformer Kit",
        "url": "https://kenney.nl/content/3-assets/4-platformer-kit/platformerkit.zip",
        "extract_to": "assets/models/environment/platformer",
        "type": "3d_models"
    },
    "kenney_ui": {
        "name": "Kenney UI Pack",
        "url": "https://kenney.nl/content/3-assets/33-ui-pack/uipack.zip",
        "extract_to": "assets/ui",
        "type": "ui"
    },
    "kenney_sounds": {
        "name": "Kenney Impact Sounds",
        "url": "https://kenney.nl/content/3-assets/58-impact-sounds/impactsounds.zip",
        "extract_to": "assets/audio/sfx",
        "type": "audio"
    },
}

# Note: Quaternius doesn't have direct download URLs, so we provide instructions
QUATERNIUS_ASSETS = {
    "character": {
        "name": "Ultimate Animated Character Pack",
        "url": "https://quaternius.com/packs/ultimateanimatedcharacter.html",
        "extract_to": "assets/models/player",
        "manual": True
    },
    "enemies": {
        "name": "Fantasy Kingdom Pack",
        "url": "https://quaternius.com/packs/fantasykingdom.html",
        "extract_to": "assets/models/enemies",
        "manual": True
    }
}

def download_file(url, filename):
    """Download file with progress bar"""
    print(f"⬇️  Downloading {filename}...")
    
    try:
        response = requests.get(url, stream=True)
        response.raise_for_status()
        
        total_size = int(response.headers.get('content-length', 0))
        block_size = 8192
        downloaded = 0
        
        with open(filename, 'wb') as f:
            for chunk in response.iter_content(chunk_size=block_size):
                if chunk:
                    f.write(chunk)
                    downloaded += len(chunk)
                    
                    if total_size > 0:
                        percent = (downloaded / total_size) * 100
                        bar_length = 40
                        filled = int(bar_length * downloaded / total_size)
                        bar = '█' * filled + '-' * (bar_length - filled)
                        print(f'\r|{bar}| {percent:.1f}%', end='', flush=True)
        
        print()  # New line after progress bar
        return True
        
    except requests.exceptions.RequestException as e:
        print(f"\n❌ Download failed: {e}")
        return False

def extract_zip(zip_path, extract_to):
    """Extract ZIP file"""
    print(f"📦 Extracting to {extract_to}...")
    
    try:
        # Create destination directory
        os.makedirs(extract_to, exist_ok=True)
        
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall(extract_to)
        
        print("✅ Extraction complete!")
        return True
        
    except Exception as e:
        print(f"❌ Extraction failed: {e}")
        return False

def cleanup_downloads():
    """Remove temporary download files"""
    print("🧹 Cleaning up temporary files...")
    temp_dir = Path("temp_downloads")
    if temp_dir.exists():
        shutil.rmtree(temp_dir)

def main():
    print("="*60)
    print("🎮 CRYSTAL QUEST - Automated Asset Downloader")
    print("="*60)
    print()
    
    # Check if we're in the project directory
    if not Path("project.godot").exists():
        print("❌ Error: project.godot not found!")
        print("📁 Please run this script from the project root directory.")
        return 1
    
    # Create temp download directory
    temp_dir = Path("temp_downloads")
    temp_dir.mkdir(exist_ok=True)
    
    print("📥 Starting automatic downloads...\n")
    
    success_count = 0
    total_count = len(ASSETS)
    
    # Download Kenney assets (automatic)
    for asset_id, asset_info in ASSETS.items():
        print(f"\n{'='*60}")
        print(f"📦 {asset_info['name']}")
        print(f"{'='*60}")
        
        # Download
        zip_filename = temp_dir / f"{asset_id}.zip"
        
        if download_file(asset_info['url'], zip_filename):
            # Extract
            if extract_zip(zip_filename, asset_info['extract_to']):
                success_count += 1
                print(f"✅ {asset_info['name']} installed successfully!")
            else:
                print(f"⚠️  {asset_info['name']} download succeeded but extraction failed.")
        else:
            print(f"⚠️  {asset_info['name']} download failed. Skipping...")
    
    # Quaternius assets (manual instructions)
    print(f"\n\n{'='*60}")
    print("📋 MANUAL DOWNLOADS REQUIRED (Quaternius Assets)")
    print(f"{'='*60}\n")
    print("Quaternius doesn't provide direct download links.")
    print("Please manually download these packs:\n")
    
    for asset_id, asset_info in QUATERNIUS_ASSETS.items():
        print(f"🔗 {asset_info['name']}")
        print(f"   URL: {asset_info['url']}")
        print(f"   Extract to: {asset_info['extract_to']}")
        print()
    
    print("\nSteps:")
    print("1. Visit each URL above")
    print("2. Click the 'Download' button")
    print("3. Extract the ZIP file")
    print("4. Copy the .glb or .fbx files to the specified folder")
    print()
    
    # Cleanup
    cleanup_downloads()
    
    # Summary
    print(f"\n{'='*60}")
    print("📊 DOWNLOAD SUMMARY")
    print(f"{'='*60}")
    print(f"✅ Automatic downloads: {success_count}/{total_count} successful")
    print(f"📋 Manual downloads: {len(QUATERNIUS_ASSETS)} required")
    print()
    
    if success_count == total_count:
        print("🎉 All automatic downloads completed successfully!")
        print("\n📝 Next steps:")
        print("1. Download Quaternius assets manually (see above)")
        print("2. Open the project in Godot 4.5.1")
        print("3. Wait for assets to import")
        print("4. Follow SCENE_SETUP_GUIDE.md to build your game!")
        print()
        return 0
    else:
        print("⚠️  Some downloads failed. Check the URLs manually.")
        return 1

if __name__ == "__main__":
    try:
        exit_code = main()
        sys.exit(exit_code)
    except KeyboardInterrupt:
        print("\n\n⛔ Download cancelled by user.")
        cleanup_downloads()
        sys.exit(1)
    except Exception as e:
        print(f"\n\n❌ Unexpected error: {e}")
        cleanup_downloads()
        sys.exit(1)
