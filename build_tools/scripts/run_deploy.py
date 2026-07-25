import sys
import os

sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import config
import build_js
import deploy_desktop

if __name__ == '__main__':
    print("=== STARTING JS BUILD & DESKTOP DEPLOYMENT ===")
    config.parse()
    build_js.make()
    deploy_desktop.make()
    print("=== DEPLOYMENT COMPLETED SUCCESSFULLY ===")
