//use FIJI as ImageJ distribution
//use IMCTOOLS ImageJ plugin    https://github.com/BodenmillerGroup/imctools
 
run("open imc file", "choose=C:/Users/myUserName/myFilePath/myMCDFileName.mcd nameofROI");
run("Image5D to Stack");
 
//choose stack number of CYP1A2 channel
setSlice(14);
run("Fire");
run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("Close");
setTool("freehand");
 
//choose stack number of CYP1A2 channel
setSlice(14);
run("Gaussian Blur...", "sigma=100 stack");
run("Select All");
run("Save XY Coordinates...", "save=C:/Users/myUserName/myFilePath/myCSVName.csv");
