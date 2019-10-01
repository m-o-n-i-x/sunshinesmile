import os.path

class cropScreen(object):

    def crop_image(self, output_dir, filename, left, top, width, height):
        """Crop the saved image with given filename for the given dimensions.
        """
        from PIL import Image

        img = Image.open(os.path.join(output_dir, filename))
        box = (int(left), int(top), int(left + width), int(top + height))

        area = img.crop(box)

        with open(os.path.join(output_dir, filename), 'wb') as output:
            area.save(output, 'png')

    def crop_element(self, output_dir, filename, left, top, width, height):
        """Crop the saved image element with given filename for the given dimensions.
        """
        from PIL import Image

        img = Image.open(os.path.join(output_dir, filename))
		#height = height-20
        box = (int(left), int(top), int(width), int(height))

        area = img.crop(box)

        with open(os.path.join(output_dir, filename), 'wb') as output:
            area.save(output, 'png')

    def cover_image(self, output_dir, filename, x0, y0, x1, y1):
        """Cover image with white rectangle
        """
        from PIL import Image, ImageFont, ImageDraw, ImageEnhance

        source_img = Image.open(os.path.join(output_dir, filename)).convert("RGBA")

        draw = ImageDraw.Draw(source_img)
        draw.rectangle(((int(x0), int(y0)), (int(x1), int(y1))), fill="white")

        with open(os.path.join(output_dir, filename), 'wb') as output:
            source_img.save(output, 'png')