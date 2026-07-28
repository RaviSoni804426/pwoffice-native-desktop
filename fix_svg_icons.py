import base64
import os

img_path = r"D:\pwoffice-native\image.png"
with open(img_path, "rb") as f:
    b64 = base64.b64encode(f.read()).decode("utf-8")

valid_svg_content = f"""<svg viewBox="0 0 2172 724" xmlns="http://www.w3.org/2000/svg">
  <image width="2172" height="724" href="data:image/png;base64,{b64}" />
</svg>"""

dark_svg = r"D:\pwoffice-native\desktop-apps\win-linux\res\icons\logo_dark.svg"
light_svg = r"D:\pwoffice-native\desktop-apps\win-linux\res\icons\logo_light.svg"

with open(dark_svg, "w", encoding="utf-8") as f:
    f.write(valid_svg_content)

with open(light_svg, "w", encoding="utf-8") as f:
    f.write(valid_svg_content)

print("Successfully wrote valid SVG XML to logo_dark.svg and logo_light.svg!")
