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
//char *filename = "man-hand.jpg";
	VideoCapture stream1(0);


if (!stream1.isOpened()) { //check if video device has been initialised
cout << "cannot open camera";
}
/*	if (argc > 1) {
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

*/	// Create some GUI windows for output display.
	namedWindow("Input Hue", CV_WINDOW_AUTOSIZE);
	namedWindow("Input Saturation", CV_WINDOW_AUTOSIZE);
	namedWindow("Input Value", CV_WINDOW_AUTOSIZE);
	namedWindow("Output Hue", CV_WINDOW_AUTOSIZE);
	namedWindow("Output Saturation", CV_WINDOW_AUTOSIZE);
	namedWindow("Output Value", CV_WINDOW_AUTOSIZE);

	
	// Convert the image to HSV colors.
//	IplImage* imageHSV = cvCreateImage( cvGetSize(imageBGR), 8, 3);	// Full HSV color image.
//	cvCvtColor(imageBGR, imageHSV, CV_BGR2HSV);				// Convert from a BGR to an HSV image.
/*	cv::Mat imageHSV = cv::Mat(imageBGR.size(), 8 , 3);
	cv::Mat imageBGR;*/
  //cvtColor(imageBGR, imageHSV, CV_BGR2HSV);
	// Get the separate HSV color components of the color input image.
	
/*	IplImage* planeH = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Hue component.
	IplImage* planeS = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Saturation component.
	IplImage* planeV = cvCreateImage( cvGetSize(imageBGR), 8, 1);	// Brightness component.
	cvCvtPixToPlane(imageHSV, planeH, planeS, planeV, 0);	// Extract the 3 color components.*/
   int morph_size = 2;
   Mat element = getStructuringElement( MORPH_RECT, Size( 2*morph_size + 1, 2*morph_size+1 ), Point( morph_size, morph_size ) );
   cout<<element;
 

   int lowThreshold = 50;
	 int ratio = 3;
	 int kernal_size = 3;

	while(true)
	{
		cv::Mat imageBGR, input;
		//stream1.read(input);
		stream1.read(imageBGR);
		//GaussianBlur(input, imageBGR, Size(5,5), 0, 0);

		namedWindow("Input Image", CV_WINDOW_AUTOSIZE);
		imshow("Input Image", imageBGR);
		cv::Mat imageHSV = cv::Mat(imageBGR.size(), 8 , 3);
		cvtColor(imageBGR, imageHSV, CV_BGR2HSV);
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
/*		if (SHOW_EXTENDED_COLOR_IMAGES)
		{

			vector<cv::Mat> planesHSV2(3);
			cv::split(imageHSV, planesHSV2);		
			planesHSV2[1].setTo(cv::Scalar(255,255,255));
			cv::Mat imageHSV2 = cv::Mat(imageBGR.size(),8 , 3);
			cv::Mat imageBGR2 = cv::Mat(imageBGR.size(),8 , 3);
			cv::merge(planesHSV2, imageHSV2);
			cvtColor(imageHSV2, imageBGR2, CV_HSV2BGR);
			namedWindow("sat max", CV_WINDOW_AUTOSIZE);
			imshow("sat max", imageBGR2);
			waitKey(0);
		}*/
	/*	if (SHOW_EXTENDED_COLOR_IMAGES)
		{
			vector<cv::Mat> planesHSV3(3);
			cv::split(imageHSV, planesHSV3);		
			planesHSV3[2].setTo(cv::Scalar(255,255,255));
			cv::Mat imageHSV3 = cv::Mat(imageBGR.size(),8 , 3);
			cv::Mat imageBGR3 = cv::Mat(imageBGR.size(),8 , 3);
			cv::merge(planesHSV3, imageHSV3);
			cvtColor(imageHSV3, imageBGR3, CV_HSV2BGR);
			namedWindow("bright max", CV_WINDOW_AUTOSIZE);
			imshow("bright max", imageBGR3);
			waitKey(0);
		}*/

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
		int minArea = 0;
		blobs.Filter(blobs, B_EXCLUDE, CBlobGetArea(), B_LESS, minArea);

		// Show the large blobs.
	 	IplImage* imageSkinBlobs = cvCreateImage( imageBGR.size(), 8, 1);	// Greyscale output image.
		for (int i = 0; i < blobs.GetNumBlobs(); i++) {
			CBlob *currentBlob = blobs.GetBlob(i);
			currentBlob->FillBlob(imageSkinBlobs, CV_RGB(255,255,255));	// Draw the large blobs as white.
		}
			cv::Mat morph_skin;
			//cv::Mat mat_skin = cv::cvarrToMat(imageSkinPixels);
	    imshow("Skin Blobs", cv::cvarrToMat(imageSkinBlobs) );
	    //morphologyEx( mat_skin, morph_skin, 3, element);   
	   // morphologyEx( imageSkinPixels, morph_skin, 3, element);   
   		//namedWindow("morph", CV_WINDOW_AUTOSIZE);
   	//	imshow("morph", morph_skin);
	    morph_skin = imageSkinPixels;
   		
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
	     //  drawContours( imageBGR, contours, i, color, 2, 8, hierarchy, 0, Point() );
	     }
	     cout<<max<<endl;
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
				std::cout<<hull_defects.size()<<endl;
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
