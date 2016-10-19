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

// Print the label and then some text info about the IplImage properties, to std::cout for easy debugging.
void printImageInfo(const IplImage *image, const char *label)
{
	if (label)
	{
		std::cout << label << ": ";
	}
	if (image)
	{
		std::cout << "[Image] = " << image->width << "x" << image->height << "px, " << image->nChannels
			<< "channels of " << image->depth << "bit depth, widthStep=" << image->widthStep << ", origin=" << image->origin;
		if (image->roi)
		{
			std::cout << " ROI=[at " << image->roi->xOffset << "," << image->roi->yOffset
				<< " of size " << image->roi->width << "x" << image->roi->height << ", COI=" << image->roi->coi << "].";
		}
		else {
			std::cout << " ROI=<null>.";
		}
		std::cout << std::endl;
	}
	else
	{
		std::cout << "[Image] = <null>" << std::endl;
	}
}


int main(int argc, char *argv[])
{
	cout << "DetectSkinBlobs:  by Shervin Emami, Oct 2010 (http://www.shervinemami.co.cc/)." << endl;
	cout << "usage: DetectSkinBlobs [image]" << endl;

	// Get the filename.
//	char *filename = "person.jpg";	// Use a default image file.
char *filename = "man-hand.jpg";
	if (argc > 1) {
		filename = argv[1];			// Use the file that was passed on the cmdline if given.
	}
	cout << "Opening file '" << filename << "'" << endl;

	// Open the color image file.
//	IplImage *imageBGR = cvLoadImage(filename, CV_LOAD_IMAGE_COLOR);
  cv::Mat imageBGR = ( imread(filename, CV_LOAD_IMAGE_COLOR) );

	if (!imageBGR.data) {
		cout << "ERROR: Couldnt open the file " << filename << endl;
		return 1;	// Quit
	}

	// Create some GUI windows for output display.
	namedWindow("Input Hue", CV_WINDOW_AUTOSIZE);
	namedWindow("Input Saturation", CV_WINDOW_AUTOSIZE);
	namedWindow("Input Value", CV_WINDOW_AUTOSIZE);
	namedWindow("Output Hue", CV_WINDOW_AUTOSIZE);
	namedWindow("Output Saturation", CV_WINDOW_AUTOSIZE);
	namedWindow("Output Value", CV_WINDOW_AUTOSIZE);

	namedWindow("Input Image", CV_WINDOW_AUTOSIZE);
	imshow("Input Image", imageBGR);
	
	// Convert the image to HSV colors.
//	IplImage* imageHSV = cvCreateImage( cvGetSize(imageBGR), 8, 3);	// Full HSV color image.
//	cvCvtColor(imageBGR, imageHSV, CV_BGR2HSV);				// Convert from a BGR to an HSV image.
	cv::Mat imageHSV = cv::Mat(imageBGR.size(), 8 , 3);
  cvtColor(imageBGR, imageHSV, CV_BGR2HSV);
	// Get the separate HSV color components of the color input image.
	
/*	IplImage* planeH = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Hue component.
	IplImage* planeS = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Saturation component.
	IplImage* planeV = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Brightness component.
	cvCvtPixToPlane(imageHSV, planeH, planeS, planeV, 0);	// Extract the 3 color components.*/
  
	std::vector<Mat> planesHSV(3);
  cv::split(imageHSV, planesHSV);
	imshow("Input Value", imageHSV);


	if (SHOW_EXTENDED_COLOR_IMAGES)
	{
		// Set the Saturation to max colorfulness and Brightness to max brightness, so we can see the color of every pixel.
	/*	IplImage* planeH1 = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Hue component.
		IplImage* planeS1 = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Saturation component.
		IplImage* planeV1 = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Brightness component.
cvCvtPixToPlane(imageHSV, planeH1, planeS1, planeV1, 0);	// Extract the 3 color components.*/
		vector<cv::Mat> planesHSV1(3);
		cv::split(imageHSV, planesHSV1);		
/*		cvSet(planeS1, CV_RGB(255,255,255));
		cvSet(planeV1, CV_RGB(255,255,255));*/	
		planesHSV1[1].setTo(cv::Scalar(255,255,255));
		planesHSV1[2].setTo(cv::Scalar(255,255,255));
/*		IplImage* imageHSV1 = cvCreateImage( cvGetSize(imageBGR), 8, 3);	// Full HSV color image.
		IplImage* imageBGR1 = cvCreateImage( cvGetSize(imageBGR), 8, 3);	// Full RGB color image.*/
		cv::Mat imageHSV1 = cv::Mat(imageBGR.size(),8 , 3);
		cv::Mat imageBGR1 = cv::Mat(imageBGR.size(),8 , 3);
/* 		cvCvtPlaneToPix( planeH1, planeS1, planeV1, 0, imageHSV1 );	// combine the separate color components.
		cvCvtColor(imageHSV1, imageBGR1, CV_HSV2BGR);				// Convert from a BGR to an HSV image. */
		cv::merge(planesHSV1, imageHSV1);
		cvtColor(imageHSV1, imageBGR1, CV_HSV2BGR);
		namedWindow("Hue colored", CV_WINDOW_AUTOSIZE);
		imshow("Hue colored", imageBGR1);
		waitKey(0);


	}
	if (SHOW_EXTENDED_COLOR_IMAGES)
	{

			vector<cv::Mat> planesHSV2(3);
		cv::split(imageHSV, planesHSV2);		
/*		cvSet(planeS1, CV_RGB(255,255,255));
		cvSet(planeV1, CV_RGB(255,255,255));*/	
		planesHSV2[1].setTo(cv::Scalar(255,255,255));
	//	planesHSV1[2].setTo(cv::Scalar(255,255,255));
/*		IplImage* imageHSV1 = cvCreateImage( cvGetSize(imageBGR), 8, 3);	// Full HSV color image.
		IplImage* imageBGR1 = cvCreateImage( cvGetSize(imageBGR), 8, 3);	// Full RGB color image.*/
		cv::Mat imageHSV2 = cv::Mat(imageBGR.size(),8 , 3);
		cv::Mat imageBGR2 = cv::Mat(imageBGR.size(),8 , 3);
/* 		cvCvtPlaneToPix( planeH1, planeS1, planeV1, 0, imageHSV1 );	// combine the separate color components.
		cvCvtColor(imageHSV1, imageBGR1, CV_HSV2BGR);				// Convert from a BGR to an HSV image. */
		cv::merge(planesHSV2, imageHSV2);
		cvtColor(imageHSV2, imageBGR2, CV_HSV2BGR);
		namedWindow("sat max", CV_WINDOW_AUTOSIZE);
		imshow("sat max", imageBGR2);
		waitKey(0);


	/*	// Set the Saturation to max, so we can see the saturation & color of every pixel.
		IplImage* planeH2 = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Hue component.
		IplImage* planeS2 = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Saturation component.
		IplImage* planeV2 = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Brightness component.
		cvCvtPixToPlane(imageHSV, planeH2, planeS2, planeV2, 0);	// Extract the 3 color components.
		cvSet(planeS2, CV_RGB(255,255,255));
		//cvSet(planeV2, CV_RGB(255,255,255));
		IplImage* imageHSV2 = cvCreateImage( cvGetSize(imageBGR), 8, 3);	// Full HSV color image.
		IplImage* imageBGR2 = cvCreateImage( cvGetSize(imageBGR), 8, 3);	// Full RGB color image.
		cvCvtPlaneToPix( planeH2, planeS2, planeV2, 0, imageHSV2 );	// combine the separate color components.
		cvCvtColor(imageHSV2, imageBGR2, CV_HSV2BGR);				// Convert from a BGR to an HSV image.
		cvNamedWindow("Saturation max", CV_WINDOW_AUTOSIZE);
		cvShowImage("Saturation max", imageBGR2);
		cvReleaseImage(&planeH2);
		cvReleaseImage(&planeS2);
		cvReleaseImage(&planeV2);
		cvReleaseImage(&imageHSV2);
		cvReleaseImage(&imageBGR2); */
	}
	if (SHOW_EXTENDED_COLOR_IMAGES)
	{
					vector<cv::Mat> planesHSV3(3);
		cv::split(imageHSV, planesHSV3);		
/*		cvSet(planeS1, CV_RGB(255,255,255));
		cvSet(planeV1, CV_RGB(255,255,255));*/	
//planesHSV3[1].setTo(cv::Scalar(255,255,255));
	planesHSV3[2].setTo(cv::Scalar(255,255,255));

	//	planesHSV1[2].setTo(cv::Scalar(255,255,255));
/*		IplImage* imageHSV1 = cvCreateImage( cvGetSize(imageBGR), 8, 3);	// Full HSV color image.
		IplImage* imageBGR1 = cvCreateImage( cvGetSize(imageBGR), 8, 3);	// Full RGB color image.*/
		cv::Mat imageHSV3 = cv::Mat(imageBGR.size(),8 , 3);
		cv::Mat imageBGR3 = cv::Mat(imageBGR.size(),8 , 3);
/* 		cvCvtPlaneToPix( planeH1, planeS1, planeV1, 0, imageHSV1 );	// combine the separate color components.
		cvCvtColor(imageHSV1, imageBGR1, CV_HSV2BGR);				// Convert from a BGR to an HSV image. */
		cv::merge(planesHSV3, imageHSV3);
		cvtColor(imageHSV3, imageBGR3, CV_HSV2BGR);
		namedWindow("bright max", CV_WINDOW_AUTOSIZE);
		imshow("bright max", imageBGR3);
		waitKey(0);


		// Set the Brightness to max, so we can see the saturation & color of every pixel.
	/*	IplImage* planeH3 = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Hue component.
		IplImage* planeS3 = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Saturation component.
		IplImage* planeV3 = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Brightness component.
		cvCvtPixToPlane(imageHSV, planeH3, planeS3, planeV3, 0);	// Extract the 3 color components.
		//cvSet(planeS3, CV_RGB(255,255,255));
		cvSet(planeV3, CV_RGB(255,255,255));
		IplImage* imageHSV3 = cvCreateImage( cvGetSize(imageBGR), 8, 3);	// Full HSV color image.
		IplImage* imageBGR3 = cvCreateImage( cvGetSize(imageBGR), 8, 3);	// Full RGB color image.
		cvCvtPlaneToPix( planeH3, planeS3, planeV3, 0, imageHSV3 );	// combine the separate color components.
		cvCvtColor(imageHSV3, imageBGR3, CV_HSV2BGR);				// Convert from a BGR to an HSV image.
		cvNamedWindow("Brightness max", CV_WINDOW_AUTOSIZE);
		cvShowImage("Brightness max", imageBGR3);
		cvReleaseImage(&planeH3);
		cvReleaseImage(&planeS3);
		cvReleaseImage(&planeV3);
		cvReleaseImage(&imageHSV3);
		cvReleaseImage(&imageBGR3);*/
	}

	// Show the input HSV channels
	imshow("Input Hue", planesHSV[0]);
	imshow("Input Saturation", planesHSV[1]);
	imshow("Input Value", planesHSV[2]);

	// Detect which pixels in each of the H, S and V channels are probably skin pixels.
	// Assume that skin has a Hue between 0 to 18 (out of 180), and Saturation above 50, and Brightness above 80.
	threshold(planesHSV[0], planesHSV[0], 18, UCHAR_MAX, CV_THRESH_BINARY_INV);
	threshold(planesHSV[1], planesHSV[1], 50, UCHAR_MAX, CV_THRESH_BINARY);
	threshold(planesHSV[2], planesHSV[2], 80, UCHAR_MAX, CV_THRESH_BINARY);

	// Show the thresholded HSV channels
	imshow("Output Hue", planesHSV[0]);
	imshow("Output Saturation", planesHSV[1]);
	imshow("Output Value", planesHSV[2]);

	// Combine all 3 thresholded color components, so that an output pixel will only
	// be white if the H, S and V pixels were also white.
/*	IplImage* imageSkinPixels = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Greyscale output image.
	cvAnd(planeH, planeS, imageSkinPixels);				// imageSkin = H {BITWISE_AND} S.
	cvAnd(imageSkinPixels, planeV, imageSkinPixels);	// imageSkin = H {BITWISE_AND} S {BITWISE_AND} V.

	// Show the output image on the screen.
	cvNamedWindow("Skin Pixels", CV_WINDOW_AUTOSIZE);
	cvShowImage("Skin Pixels", imageSkinPixels); */

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
	int minArea = 100;
	blobs.Filter(blobs, B_EXCLUDE, CBlobGetArea(), B_LESS, minArea);

	// Show the large blobs.
 	IplImage* imageSkinBlobs = cvCreateImage( imageBGR.size(), 8, 1);	// Greyscale output image.
	for (int i = 0; i < blobs.GetNumBlobs(); i++) {
		CBlob *currentBlob = blobs.GetBlob(i);
		currentBlob->FillBlob(imageSkinBlobs, CV_RGB(255,255,255));	// Draw the large blobs as white.
	}
    cvShowImage("Skin Blobs", imageSkinBlobs);

	// Wait until the user hits a key on the GUI window.
	cvWaitKey(0);	// Note that if you don't use cvWaitKey(), OpenCV will never display anything!

	
	cvReleaseImage( &imageSkinPixels_ipl );
	cvReleaseImage( &imageSkinBlobs);

	// Quit
	return 0;
}
