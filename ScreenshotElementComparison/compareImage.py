# import the necessary packages
from skimage.measure import compare_ssim
import cv2

class compareImage(object):

    def compare_image(self, image_1_path, image_2_path):
        image_1 = cv2.imread(image_1_path)
        image_2 = cv2.imread(image_2_path)

        # convert the images to grayscale
        grayA = cv2.cvtColor(image_1, cv2.COLOR_BGR2GRAY)
        grayB = cv2.cvtColor(image_2, cv2.COLOR_BGR2GRAY)

        # compute the Structural Similarity Index (SSIM) between the two
        # images, ensuring that the difference image is returned
        (score, diff) = compare_ssim(grayA, grayB, full=True)
        return 1 - score