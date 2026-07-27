import base64

img_path = r"D:\pwoffice-native\image.png"
b64 = base64.b64encode(open(img_path, "rb").read()).decode("utf-8")
svg_content = f"""<svg viewBox="0 0 2172 724" xmlns="http://www.w3.org/2000/svg">
  <image width="2172" height="724" href="data:image/png;base64,{b64}" />
</svg>"""

dark_path = r"D:\pwoffice-native\desktop-apps\common\loginpage\res\img\idx-logo-dark.svg"
light_path = r"D:\pwoffice-native\desktop-apps\common\loginpage\res\img\idx-logo-light.svg"

with open(dark_path, "w") as f:
    f.write(svg_content)
with open(light_path, "w") as f:
    f.write(svg_content)

print("SVGs created successfully!")
