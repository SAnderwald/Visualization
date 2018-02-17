import org.gicentre.utils.stat.*;    // For chart classes. 
// Displays a simple line chart representing a time series.
 
XYChart lineChart;
 
// Loads data into the chart and customises its appearance.
void setup()
{
  size(800,500);
  textFont(createFont("Arial",10),10);
 

  // Both x and y data set here.  
  lineChart = new XYChart(this);
  lineChart.setData(new float[] {2009, 2010,2011,2012,2013.2013,2014,2015,2016,2017},
                    new float[] { 2575, 5056, 34900, 199876,1425459,1817513,2890991,5944294,8620924});
 
  
   
  // Axis formatting and labels.
  lineChart.showXAxis(true); 
  lineChart.showYAxis(true); 
  lineChart.setMinY(0);
     
  lineChart.setYFormat("###,###,###");  
  lineChart.setXFormat("0000");     
   
  // Symbol colours
  lineChart.setPointColour(color(255,128,54,200));
  lineChart.setPointSize(10);
  lineChart.setLineWidth(2);
}
 
// Draws the chart and a title.
void draw()
{

  background(155,191,189,10);
 
  textSize(9);
  lineChart.draw(15,15,width-30,height-30);
   
  // Draw a title over the top of the chart.
  fill(0);
  textSize(20);
  text("BitCoin Transaction as Reported on January of the Year", 80,30);
  textSize(11);
  
}
