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

void getCanny(cv::Mat& skin, cv::Mat& skin_canny)
{
	int thresh = 75;
	cv::Canny(skin, skin_canny, thresh, thresh*2, 3);
	imshow("test_canny", skin_canny);
}

void getHandContour(cv::Mat& morph_skin, 
								    cv::Mat& imageBGR, 
								    std::vector<std::vector<Point> > max_contour)
{
	cv::Mat canny_image;
	//getCanny(morph_skin, canny_image);
	cv::cvtColor(morph_skin, canny_image, CV_BGR2GRAY);
	vector<vector<Point> > contours;
	vector<Vec4i> hierarchy;

	findContours(canny_image, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_TC89_L1, Point(0,0));
	int max = -100;
	
	if(contours.size() > 0)
	{
		for( int i = 0; i< contours.size(); i++ )
		{
		 if(contourArea(contours[i]) > max)
		 {
			max_contour.clear();
			max_contour.push_back(contours[i]);
			max = contourArea(contours[i]);
		 }
		}
	}

	if(max_contour.size() > 0)
	{
		for(int i = 0; i < max_contour.size(); ++i)
		{
			cv::Scalar color(255, 0, 0);
			drawContours( imageBGR, max_contour, i, color, 2, 8, hierarchy, 0, Point() );
		}
	}
	
	std::vector<Point> hull;
	std::vector<int> hull_num;
	convexHull(max_contour[0], hull, false,true );	
	convexHull(max_contour[0], hull_num, false, true);

	const Point *pts = (const cv::Point*) Mat(hull).data;
	int npts = hull.size();
	polylines(imageBGR, &pts, &npts, 1, true, Scalar(0,0,255));
}

void getSkinBlob(cv::Mat& imageSkinPixels, cv::Mat& blobBGR, cv::Mat& imageBGR)
{
	// Find blobs in the image.
	CBlobResult blobs;

  // printImageInfo(imageSkinPixels, "imageSkinPixels");
	IplImage* imageSkinPixels_ipl = new IplImage(imageSkinPixels);
	blobs = CBlobResult(imageSkinPixels_ipl, NULL, 0);	// Use a black background color.

	// Ignore the blobs whose area is less than minArea.
	int minArea = 0;
	blobs.Filter(blobs, B_EXCLUDE, CBlobGetArea(), B_LESS, minArea);

	// Show the large blobs.
	IplImage* imageSkinBlobs = cvCreateImage( imageSkinPixels.size(), 8, 1);	// Greyscale output image.
	for (int i = 0; i < blobs.GetNumBlobs(); i++) 
	{
		CBlob *currentBlob = blobs.GetBlob(i);
		currentBlob->FillBlob(imageSkinBlobs, CV_RGB(255,255,255));	// Draw the large blobs as white.
	}


	cv::Mat skinBlob = cv::cvarrToMat(imageSkinBlobs);
	imshow("Skin Blobs", skinBlob);

	blobBGR = cv::Mat(skinBlob.size(), CV_8UC3);
	blobBGR = cv::Vec3b(0,0,0);
	for(int i = 0; i < imageBGR.rows; i++)
	{
		for(int j = 0; j < imageBGR.cols; j++)
		{
			cv::Point pt = cv::Point(j,i);
			if(skinBlob.at<uchar>(pt) == (uchar)255)
			{
				blobBGR.at<cv::Vec3b>(pt) = imageBGR.at<cv::Vec3b>(pt); 
			}
		}
	}
	imshow("test", blobBGR);

}

void processImage(cv::Mat& imageBGR)
{
	// Create some GUI windows for output display.
	namedWindow("Input Hue", CV_WINDOW_AUTOSIZE);
	namedWindow("Input Saturation", CV_WINDOW_AUTOSIZE);
	namedWindow("Input Value", CV_WINDOW_AUTOSIZE);
	namedWindow("Output Hue", CV_WINDOW_AUTOSIZE);
	namedWindow("Output Saturation", CV_WINDOW_AUTOSIZE);
	namedWindow("Output Value", CV_WINDOW_AUTOSIZE);
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
	//threshold(planesHSV[1], planesHSV[1], 50, UCHAR_MAX, CV_THRESH_BINARY);
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

	cv::Mat morph_skin;
	getSkinBlob(imageSkinPixels, morph_skin, imageBGR);

	int morph_size = 2;
	Mat element = getStructuringElement( MORPH_RECT, Size( 2*morph_size + 1, 2*morph_size+1 ), Point( morph_size, morph_size ) );

	vector<std::vector<Point> > max_contour;
	getHandContour(morph_skin, imageBGR, max_contour);

	namedWindow("contour image", CV_WINDOW_AUTOSIZE);
	imshow("contour image", imageBGR);
}

int main(int argc, char *argv[])
{
	cout << "DetectSkinBlobs:  by Shervin Emami, Oct 2010 (http://www.shervinemami.co.cc/)." << endl;
	cout << "usage: DetectSkinBlobs [image]" << endl;

	VideoCapture stream1(0);


	if (!stream1.isOpened()) { //check if video device has been initialised
	cout << "cannot open camera";
	}


	 
	int lowThreshold = 50;
	int ratio = 3;
	int kernal_size = 3;

	while(true)
	{
		cv::Mat imageBGR, input;
		stream1.read(input);
		//stream1.read(imageBGR);
		cv::GaussianBlur(input, imageBGR, Size(7,7), 0, 0);
		cv::Mat canny_BGR;
		//getCanny(imageBGR, canny_BGR);
		getCanny(imageBGR, canny_BGR);
		processImage(imageBGR);
		
		// Wait until the user hits a key on the GUI window.
		cvWaitKey(0);	// Note that if you don't use cvWaitKey(), OpenCV will never display anything!

	}

	// Quit
	return 0;
}
