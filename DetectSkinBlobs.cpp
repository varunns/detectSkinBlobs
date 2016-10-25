/* Use Blob Detection to Detect Human Skin. by Shervin Emami, Oct 2010 (http://www.shervinemami.co.cc/).
	 (Make sure the file "cvblobslib.lib" (from the cvBlobsLib Library) is added to your project).
 */

#include <iostream>

// Include OpenCV
#include "opencv/cv.h"
#include "opencv2/highgui/highgui.hpp"
#include <opencv2/core/core.hpp>
#include "opencv2/imgproc/imgproc.hpp"
// Include cvBlobsLib
#include "cvBlobsLib/src/BlobResult.h"


//bool SHOW_EXTENDED_COLOR_IMAGES = false;	// Whether or not to also show the 3 extended Hue,Sat,Brightness images.
bool SHOW_EXTENDED_COLOR_IMAGES = true;

using namespace std;
using namespace cv;

void getContour(cv::Mat& imageBGR, cv::Mat& imageHSV)
{

}

int main(int argc, char *argv[])
{
	cout << "DetectSkinBlobs:  by Shervin Emami, Oct 2010 (http://www.shervinemami.co.cc/)." << endl;
	cout << "usage: DetectSkinBlobs [image]" << endl;

	// Get the filename.
//	char *filename = "person.jpg";	// Use a default image file.
//char *filename = "man-hand.jpg";
	VideoCapture stream1(0);


if (!stream1.isOpened()) { //check if video device has been initialised
cout << "cannot open camera";
}
// Create some GUI windows for output display.
namedWindow("Input Hue", CV_WINDOW_AUTOSIZE);
namedWindow("Input Saturation", CV_WINDOW_AUTOSIZE);
namedWindow("Input Value", CV_WINDOW_AUTOSIZE);
namedWindow("Output Hue", CV_WINDOW_AUTOSIZE);
namedWindow("Output Saturation", CV_WINDOW_AUTOSIZE);
namedWindow("Output Value", CV_WINDOW_AUTOSIZE);

int morph_size = 2;
Mat element = getStructuringElement( MORPH_RECT, Size( 2*morph_size + 1, 2*morph_size+1 ), Point( morph_size, morph_size ) );
 
int lowThreshold = 50;
int ratio = 3;
int kernal_size = 3;

	while(true)
	{
		cv::Mat imageBGR, input;
		//stream1.read(input);
		stream1.read(imageBGR);
		
		//GaussianBlur(input, imageBGR, size(5,5), 0, 0);
		cv::Mat imageBGR1;
	//	bilateralFilter(imageBGR, imageBGR1, -1, 5, 5);
		namedWindow("Input Image", CV_WINDOW_AUTOSIZE);
		imshow("Input Image", imageBGR);
		cv::Mat imageHSV = cv::Mat(imageBGR.size(), 8 , 3);
		cvtColor(imageBGR, imageHSV, CV_BGR2HSV);
		std::vector<Mat> planesHSV(3);
		cv::split(imageHSV, planesHSV);
		imshow("Input Value", imageHSV);


		// Show the input HSV channels
		imshow("Input Hue", planesHSV[0]);
		imshow("Input Saturation", planesHSV[1]);
		imshow("Input Value", planesHSV[2]);

		// Detect which pixels in each of the H, S and V channels are probably skin pixels.
		// Assume that skin has a Hue between 0 to 18 (out of 180), and Saturation above 50, and Brightness above 80.
		threshold(planesHSV[0], planesHSV[0], 18, UCHAR_MAX, CV_THRESH_BINARY_INV);
//		threshold(planesHSV[1], planesHSV[1], 50, UCHAR_MAX, CV_THRESH_BINARY);
		threshold(planesHSV[1], planesHSV[1], 10, UCHAR_MAX, CV_THRESH_BINARY);
		threshold(planesHSV[2], planesHSV[2], 50, UCHAR_MAX, CV_THRESH_BINARY);
		//threshold(planesHSV[2], planesHSV[2], 80, UCHAR_MAX, CV_THRESH_BINARY);
		// Show the thresholded HSV channels
		imshow("Output Hue", planesHSV[0]);
		imshow("Output Saturation", planesHSV[1]);
		imshow("Output Value", planesHSV[2]);

		cv::Mat imageSkinPixels = cv::Mat(imageBGR.size(), 8 , 1);
		cv::bitwise_and(planesHSV[0], planesHSV[1], imageSkinPixels);
		cv::bitwise_and(imageSkinPixels, planesHSV[2], imageSkinPixels);
		namedWindow("Skin Pixels", CV_WINDOW_AUTOSIZE);
		imshow("Skin Pixels", imageSkinPixels); 
		waitKey(0);

		// Find blobs in the image.
		CBlobResult blobs;

	//	printImageInfo(imageSkinPixels, "imageSkinPixels");
		IplImage* imageSkinPixels_ipl = new IplImage(imageSkinPixels);
		blobs = CBlobResult(imageSkinPixels_ipl, NULL, 0);	// Use a black background color.

		// Ignore the blobs whose area is less than minArea.
		int minArea = 500;
		blobs.Filter(blobs, B_EXCLUDE, CBlobGetArea(), B_LESS, minArea);

		// Show the large blobs.
		IplImage* imageSkinBlobs = cvCreateImage( imageBGR.size(), 8, 1);	// Greyscale output image.
		for (int i = 0; i < blobs.GetNumBlobs(); i++) 
		{
			CBlob *currentBlob = blobs.GetBlob(i);
			currentBlob->FillBlob(imageSkinBlobs, CV_RGB(255,255,255));	// Draw the large blobs as white.
		}

		cv::Mat morph_skin;
		
		imshow("Skin Blobs", cv::cvarrToMat(imageSkinBlobs) );
		morph_skin = cv::cvarrToMat(imageSkinBlobs);


		cv::Mat canny_blob_image;

		Canny(morph_skin, canny_blob_image, lowThreshold, lowThreshold*ratio, kernal_size);
		imshow("Canny", canny_blob_image);
		cv::Mat contour_image ;

		cvtColor(morph_skin, contour_image, CV_GRAY2BGR);
		vector<vector<Point> > contours;
		vector<Vec4i> hierarchy;
	
		findContours(morph_skin, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE, Point(0,0));
		int max = -100;
		vector<std::vector<Point> > max_contour;
		if(contours.size() > 0)
		{

			RNG rng(12345);
			for( int i = 0; i< contours.size(); i++ )
			{
			 if(contourArea(contours[i]) > max)
			 {
				max_contour.clear();
				max_contour.push_back(contours[i]);
				max = contourArea(contours[i]);
			 }
			 Scalar color = Scalar( rng.uniform(0, 255), rng.uniform(0,255), rng.uniform(0,255) );
			 drawContours( contour_image, contours, i, color, 2, 8, hierarchy, 0, Point() );
			}
		
		 for(int i = 0; i < max_contour.size(); ++i)
		 {
			cv::Scalar color(255, 0, 0);
			drawContours( imageBGR, max_contour, i, color, 2, 8, hierarchy, 0, Point() );
		 }

		 std::vector<Point> hull;
		 std::vector<int> hull_num;
		 convexHull(max_contour[0], hull, false,true );	
		 convexHull(max_contour[0], hull_num, false, true);
		 vector<cv::Vec4i> hull_defects;

			if(hull.size() > 2)
			{
				convexityDefects(max_contour[0], hull_num, hull_defects);	
				for(int i = 0; i < hull_defects.size(); ++i)
				{
				//                    circle(imageBGR, cv::Point(hull_defects[i][0], hull_defects[i][1]), 50, cv::Scalar(0,255,0), 1, 8, 0);
				}
			}
		 
		 const Point *pts = (const cv::Point*) Mat(hull).data;
		 int npts = hull.size();
		 polylines(imageBGR, &pts, &npts, 1, true, Scalar(0,0,255));


		 namedWindow("contour image", CV_WINDOW_AUTOSIZE);
		 imshow("contour image", imageBGR);
		}

		// Wait until the user hits a key on the GUI window.
		cvWaitKey(0);	// Note that if you don't use cvWaitKey(), OpenCV will never display anything!

	}

	// Quit
	return 0;
}
