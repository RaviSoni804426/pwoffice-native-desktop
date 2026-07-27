import os
import sys

base_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(base_dir + "/../../build_tools/scripts")
import config
import base

if __name__ == '__main__':
    print("=== STARTING PW OFFICE BRANDING BUILD ===")
    base.set_env("OO_BRANDING", "branding")
    # Redirect back to the main make script after injecting our defaults
    base.cmd_in_dir(base_dir + "/../../build_tools", "python", ["make.py"])
