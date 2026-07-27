import os
import sys

base_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(base_dir + "/build_tools/scripts")
import config
import base
import build_sln
import deploy_desktop

if __name__ == '__main__':
    print("=== STARTING NATIVE REBUILD ONLY ===")
    base.set_env("OO_BRANDING", "branding")
    config.parse()
    config.parse_defaults()
    print("Branding Name: ", config.option("branding-name"))
    print("App Name: ", config.option("app-name"))
    
    # 1. Build C++ solution
    build_sln.make()
    
    # 2. Deploy only the desktop app (copies exe to build folder)
    deploy_desktop.make()
    print("=== NATIVE DEPLOYMENT COMPLETED ===")
